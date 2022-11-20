{
  description = "Bo's nixos configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager/master";
  };

  outputs = { nixpkgs, home-manager, ... }@inputs:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
        config = { allowUnfree = true; };
      };
      lib = nixpkgs.lib;

    in
    {
      homeConfigurations."bohendo" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [
          ./user/home.nix
          {
            home = {
              username = "bohendo";
              homeDirectory = "/home/bohendo";
              stateVersion = "22.05";
            };
          }
        ];
      };

      nixosConfigurations = {
        asus = lib.nixosSystem {
          inherit system;
          modules = [
            ./system/asus.nix
          ];
          specialArgs = { inherit inputs; };
        };
        system76 = lib.nixosSystem {
          inherit system;
          modules = [
            ./system/system76.nix
          ];
          specialArgs = { inherit inputs; };
        };
      };

    };

}
