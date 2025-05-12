{pkgs, unstable, config, ...}:
{
  home.packages = with pkgs; [
    ripgrep
    texlive.combined.scheme-full
  ];

  programs.neovim = {
    vimAlias = true;
    viAlias = true;
    withNodeJs = true;
  };


  home.file."./.config/nvim/" = {
      source = ./nvim;
      recursive = true;
  };

}
