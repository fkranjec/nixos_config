{ config, inputs, pkgs, ... }:
let
  nvidia-offload = pkgs.writeShellScriptBin "nvidia-offload" ''
    export __NV_PRIME_RENDER_OFFLOAD=1
    export __NV_PRIME_RENDER_OFFLOAD_PROVIDER=NVIDIA-G0
    export __GLX_VENDOR_LIBRARY_NAME=nvidia
    export __VK_LAYER_NV_optimus=NVIDIA_only
    exec -a "$0" "$@"
  '';
in
{
  imports =
    [
      ./hardware-configuration.nix
    ];

  boot = {
    loader = {
        systemd-boot.enable = true;
        efi.canTouchEfiVariables = true;
    };
  };

  environment.sessionVariables = {
    LIBVA_DRIVER_NAME = "nvidia";
    GBM_BACKEND = "nvidia-drm";
    XDG_SESSION_TYPE = "wayland";
    __GLX_VENDOR_LIBRARY_NAME = "nvidia";
    WLR_NO_HARDWARE_CURSORS = "1";
  };

  virtualisation.docker.enable = true;

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  programs = {
    hyprland.enable = true;
  };

  networking.hostName = "nixos";

  networking.networkmanager.enable = true;
  
  networking.firewall.allowedTCPPorts = [80 443 4200 5051 8000];

  time.timeZone = "Europe/Zagreb";

  i18n = {
    defaultLocale = "en_US.UTF-8";
    extraLocaleSettings = {
      LC_ADDRESS = "hr_HR.UTF-8";
      LC_IDENTIFICATION = "hr_HR.UTF-8";
      LC_MEASUREMENT = "hr_HR.UTF-8";
      LC_MONETARY = "hr_HR.UTF-8";
      LC_NAME = "hr_HR.UTF-8";
      LC_NUMERIC = "hr_HR.UTF-8";
      LC_PAPER = "hr_HR.UTF-8";
      LC_TELEPHONE = "hr_HR.UTF-8";
      LC_TIME = "hr_HR.UTF-8";
    };
  };

  services = {
    displayManager.autoLogin.enable = true;
    displayManager.autoLogin.user = "fkranjec";
    xserver = {
      enable = true;
      displayManager.gdm.enable = true;
    };

    postgresql = {
      enable = true;
      package = pkgs.postgresql_16;
    };
    blueman.enable = true;

    printing.enable = true;
    teamviewer.enable= true;
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };
  };

  console.keyMap = "croat";

  hardware.pulseaudio.enable = false;
  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;
  security.rtkit.enable = true;

  users.users.fkranjec = {
    isNormalUser = true;
    description = "Filip";
    extraGroups = [ "networkmanager" "wheel" "video" ];
  };
   
  programs.ssh.startAgent = true;

  nixpkgs.overlays = [
    (self: super: {
      waybar = super.waybar.overrideAttrs (oldAttrs: {
        mesonFlags = oldAttrs.mesonFlags ++ [ "-Dexperimental=true" ];
      });
    })
  ];
  
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    nvidia-offload
    wget
    go
    redis
    rose-pine-cursor
    nwg-look
    glib
    inputs.rose-pine-hyprcursor.packages.${pkgs.system}.default
  ];

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
    extraPackages = with pkgs; [nvidia-vaapi-driver];
  };

  services.xserver.videoDrivers = ["nvidia" "nvidia-dkms"];

  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement = {
      enable = false;
      finegrained = false;
    };
    open = false;
    nvidiaPersistenced = true;
    package = config.boot.kernelPackages.nvidiaPackages.stable;
    prime = {
      offload.enable = true;
      offload.enableOffloadCmd = true;
      amdgpuBusId = "PCI:5:0:0";
      nvidiaBusId = "PCI:1:0:0";
    };
    nvidiaSettings = true;
  };
 
  services.dbus.enable = true;

  xdg.portal = {
    enable = true;
    extraPortals = [
      pkgs.xdg-desktop-portal-hyprland
    ];
  };

  programs.dconf.enable = true;
  
  system.stateVersion = "23.11";
}
