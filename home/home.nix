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
      erlang_26
      beam.packages.erlang_26.rebar3
      yaws
      thunderbird
      nodejs
      brave
      gcc
      spotify
      python3
      spotifyd
      playerctl
      hyprpaper
      hyprlock
      hypridle
      grimblast
      gnome.nautilus
      xdg-desktop-portal-hyprland
      spicetify-cli
      swaynotificationcenter
      unzip
      rofi-wayland
      mattermost-desktop
      cargo
      wayland-protocols
      wayland-utils
      pavucontrol
      pulseaudio
      wayland
      killall
      git
      gnumake
      glxinfo
      (nerdfonts.override { fonts = [ "FiraCode" ]; })
    ];
  };
  programs.home-manager.enable = true;

}

