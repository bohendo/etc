{
  description = "My darwin configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/bd4bfd814e96488febb38b4b4d0549c56b840c7f";
    darwin.url = "github:lnl7/nix-darwin/6349b99bc2b96ded34d068a88c7c5ced406b7f7f";
    home-manager.url = "github:nix-community/home-manager/948d1f8a5cef55a281d4f5d17f3b79df6c82fce1";
  };

  outputs = { self, darwin, nixpkgs, home-manager, ... }@inputs:
    let
      system = "aarch64-darwin";
      pkgs = import nixpkgs {
        inherit system;
        config = { allowUnfree = true; };
      };
    in
    {
      homeConfigurations."bohendo" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [ ./user/home.nix ];
      };

      darwinConfigurations = {
        darwin = darwin.lib.darwinSystem {
          inherit system inputs pkgs;
          modules = [ ./system/configuration.nix ];
        };
      };
    };
}
