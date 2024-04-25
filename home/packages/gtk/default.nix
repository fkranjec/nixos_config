{ pkgs, ... }:

{
  gtk = {
    enable = true;
    cursorTheme = {
      package = pkgs.nordzy-cursor-theme;
      name = "Nordzy";
    };
    font = {
      package = (pkgs.nerdfonts.override { fonts = [ "FiraCode" ]; });
      name = "FiraCode Nerd Font";
      size = 14;
    };
    # iconTheme = {
    #   package = pkgs.nordzy-icon-theme;
    #   name  = "Nordzy-Icon";
    # };
    theme = {
      package = pkgs.nordic;
      name = "Nordic";
    };
  };
}
