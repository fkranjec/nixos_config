{ pkgs, ... }:

{
  gtk = {
    enable = true;
    cursorTheme = {
      package = pkgs.capitaine-cursors-themed;
      name = "capitaine-cursors-themed-nord";
    };
    font = {
      package = (pkgs.nerdfonts.override { fonts = [ "FiraCode" ]; });
      name = "FiraCode Nerd Font";
      size = 12;
    };
    iconTheme = {
      package = pkgs.papirus-nord.override {
         accent = "auroragreen";
      };
      name  = "Papirus-Nord";
    };
    theme = {
      package = pkgs.nordic;
      name = "Nordic";
    };
  };
}
