{pkgs, ...}: let
  username = "fkranjec";
in {
  imports = [
    ./packages
  ];

  fonts ={
    fontconfig ={
      enable = true;
    };
  };

  programs.bash.enable = true;

  home = {
    username = "${username}";
    homeDirectory = "/home/${username}";
    stateVersion = "23.11";
    sessionPath = [
      "$HOME/.npm-global/bin/"
    ];

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
      mattermost-desktop
      cargo
      wayland-protocols
      wayland-utils
      mako
      pavucontrol
      wayland
      killall
      git
      skypeforlinux
      glxinfo
      (nerdfonts.override { fonts = [ "FiraCode" ]; })
    ];
  };
  programs.home-manager.enable = true;

}

