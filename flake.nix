{
  description = "Bo's nixos configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/1f4c790f716a7bad8bb000e5cf07e3b5d36a48b8";
    home-manager.url = "github:nix-community/home-manager/433e8de330fd9c157b636f9ccea45e3eeaf69ad2";
    nixos-hardware.url = "github:nixos/nixos-hardware/1108c1b8614017c8b52005054fd27a00e4feb51b";
    darwin.url = "github:lnl7/nix-darwin/6349b99bc2b96ded34d068a88c7c5ced406b7f7f";
    foundry.url = "github:shazow/foundry.nix/monthly";
  };

  outputs = { self, nixpkgs, home-manager, nixos-hardware, darwin, foundry, ... }@inputs:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
        config = {
          allowUnfree = true;
          # cudaSupport = true;
        };
      };
      lib = nixpkgs.lib;

    in
    {

      # TODO: give this one iff system is nixos
      homeConfigurations."bohendo" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [
          ./nixos/user/home.nix
          {
            home = {
              username = "bohendo";
              homeDirectory = "/home/bohendo";
              stateVersion = "22.05";
            };
          }
        ];
      };
      # TODO: else give this one
      # homeConfigurations."bohendo" = home-manager.lib.homeManagerConfiguration {
      #   inherit pkgs;
      #   modules = [ ./darwin/user/home.nix ];
      # };

      darwinConfigurations = {
        darwin = darwin.lib.darwinSystem {
          inherit system inputs pkgs;
          modules = [ ./system/configuration.nix ];
        };
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
            nixos-hardware.nixosModules.system76
            ./system/system76.nix
          ];
          specialArgs = { inherit inputs; };
        };
      };

    };

}
