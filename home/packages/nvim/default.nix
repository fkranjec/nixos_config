{pkgs, config, ...}:{
  home.packages = with pkgs; [
    ripgrep
  ];

  programs.neovim = {
    enable = true;
    vimAlias = true;
    viAlias = true;
    withNodeJs = true;
  };

  home.file."./.config/nvim/" = {
      source = ./nvim;
      recursive = true;
  };

}
