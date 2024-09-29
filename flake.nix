{
  description = "NixOS config";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs = {nixpkgs, ...} @ inputs: let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages."x86_64-linux";
  in {
    nixosConfigurations = {
      pc = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs system;};
        modules = [
          ./hardware/pc/hardware-configuration.nix
          ./configuration.nix
        ];
      };
      v110 = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs system;};
        modules = [
          ./hardware/v110/hardware-configuration.nix
          ./configuration.nix
        ];
      };
    };
    homeConfigurations.fvrn = inputs.home-manager.lib.homeManagerConfiguration {
      inputs.home-manager.useGlobalPkgs = true;
      inputs.home-manager.useUserPackages = true;
      inherit pkgs;
      modules = [
        ./home.nix
      ];
    };
  };
}
