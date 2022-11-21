{
  description = "Bo's nixos configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/1f4c790f716a7bad8bb000e5cf07e3b5d36a48b8";
    nixos-hardware.url = "github:nixos/nixos-hardware/1108c1b8614017c8b52005054fd27a00e4feb51b";
    home-manager.url = "github:nix-community/home-manager/433e8de330fd9c157b636f9ccea45e3eeaf69ad2";
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
            inputs.nixos-hardware.nixosModules.system76
            ./system/system76.nix
          ];
          specialArgs = { inherit inputs; };
        };
      };

    };

}
