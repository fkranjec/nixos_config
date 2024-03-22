{pkgs, ...}: let
  username = "filip";
in {
  imports = [
    ./packages
  ];

  fonts.fontconfig.enable = true;

  home = {
    username = "${username}";
    homeDirectory = "/home/${username}";
    stateVersion = "23.11";

    packages = with pkgs; [
    waybar
    alacritty
    thunderbird
    neovim
    nodejs
    brave
    dunst
    gcc
    unzip
    swww
    hyprland
    rofi-wayland
    gnome.gnome-terminal
    wayland-protocols
    wayland-utils
    mako
    wayland
    killall
    git
    glxinfo # to check what gpu is running
 
        (pkgs.writeShellScriptBin "nvidia-offload" ''
            export __NV_PRIME_RENDER_OFFLOAD=1
            export __NV_PRIME_RENDER_OFFLOAD_PROVIDER=NVIDIA-G0
            export __GLX_VENDOR_LIBRARY_NAME=nvidia
            export __VK_LAYER_NV_optimus=NVIDIA_only
            exec "$0"
        '')
    ];
  };

  programs.home-manager.enable = true;

}

