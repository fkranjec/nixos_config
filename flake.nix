{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";
    unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager/release-24.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    rose-pine-hyprcursor.url = "github:ndom91/rose-pine-hyprcursor";
    hyprland.url = "github:hyprwm/Hyprland";
    split-monitor-workspaces = {
      url = "github:fkranjec/split-monitor-workspaces";
      inputs.hyprland.follows = "hyprland";
    };
  };

  outputs = inputs @{
    self,
    nixpkgs,
    unstable,
    home-manager,
    split-monitor-workspaces,
    ...
  } :
    let system = "x86_64-linux";
    pkgs = import nixpkgs {
      inherit system;
      config = {
	allowUnfree = true;
      };
    };

    unstable = import inputs.unstable{
      inherit system;
      config = {
	allowUnfree = true;
      };
    };
    in
    {
    nixosConfigurations = {
      nixos = nixpkgs.lib.nixosSystem {
	system = "x86_64-linux";
	specialArgs = { inherit inputs; };
	modules = [
	  ./system/configuration.nix
	  home-manager.nixosModules.home-manager
	  {
	    home-manager.useGlobalPkgs = true;
	    home-manager.useUserPackages = true;
	    home-manager.users.fkranjec = import ./home/home.nix;
	    home-manager.extraSpecialArgs = {inherit inputs unstable self;};
	  }
	];
      };
    };
  };
}
