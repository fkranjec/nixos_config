{pkgs, unstable, ...}: let
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
    stateVersion = "25.05";
    sessionPath = [
      "$HOME/.npm-global/bin/"
    ];
      
    packages = with pkgs; [
      unstable.neovim
      waybar
      wasm-bindgen-cli
      openssl
      alacritty
      erlang_27
      unstable.beam.packages.erlang_27.rebar3
      thunderbird
      unstable.elmPackages.elm
      unstable.elmPackages.elm-format
      unstable.signal-desktop
      grimblast
      nodejs
      wasm-pack
      teamviewer
      brave
      gcc
      zathura
      spotify
      python3
      unstable.protobuf_27
      unstable.postman
      spotifyd
      playerctl
      hyprpaper
      hyprlock
      hypridle
      hyprcursor
      grimblast
      nautilus
      xdg-desktop-portal-hyprland
      spicetify-cli
      swaynotificationcenter
      unzip
      rofi-wayland
      mattermost-desktop
      rustup
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

