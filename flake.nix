{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprland.url = "github:hyprwm/Hyprland";
    split-monitor-workspaces = {
      url = "github:fkranjec/split-monitor-workspaces";
      inputs.hyprland.follows = "hyprland";
    };
  };

  outputs = inputs @{
    self,
    nixpkgs,
    home-manager,
    split-monitor-workspaces,
    ...
  } : {
    nixosConfigurations = {
      nixos = nixpkgs.lib.nixosSystem {
	system = "x86_64-linux";
	modules = [
	  ./system/configuration.nix
	  home-manager.nixosModules.home-manager
	  {
	    home-manager.useGlobalPkgs = true;
	    home-manager.useUserPackages = true;
	    home-manager.users.fkranjec = import ./home/home.nix;
	    home-manager.extraSpecialArgs = {inherit inputs self;};
	  }
	];
      };
    };
  };
}
