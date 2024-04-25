{ pkgs, ... }:

{
  gtk = {
    enable = true;
    cursorTheme = {
      package = pkgs.capitaine-cursors-themed;
      name = "Capitaine";
    };
    iconTheme = {
      package = pkgs.papirus-nord;
      name  = "auroragreen";
    };
    theme = {
      package = pkgs.nordic;
      name = "Nordic";
    };
  };
}
