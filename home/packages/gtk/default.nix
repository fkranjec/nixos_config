{ pkgs, ... }:

{
  gtk = {
    enable = true;
    iconTheme = {
      package = pkgs.nordzy-icon-theme;
      name  = "Nordzy";
    };
    theme = {
      package = pkgs.nordic;
      name = "Nordic";
    };
  };
}
