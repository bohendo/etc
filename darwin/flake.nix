{
  description = "Bo's darwin configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-22.05-darwin";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    darwin.url = "github:lnl7/nix-darwin/master";
    darwin.inputs.nixpkgs.follows = "nixpkgs-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs-unstable";
  };

  outputs = { self, darwin, nixpkgs, home-manager, ... }@inputs:
    let
      system = "aarch64-darwin";
      pkgs = import nixpkgs {
        inherit system;
        config = { allowUnfree = true; };
        overlays = attrValues self.overlays ++ singleton (
          # Sub in x86 version of packages that don't build on Apple Silicon yet
          final: prev: (optionalAttrs (prev.stdenv.system == "aarch64-darwin") {
            inherit (final.pkgs-x86)
              nix-index
              niv
          })
        );

      };
      lib = nixpkgs.lib;
    in
    {
      darwinConfigurations = {

        darwin = darwin.lib.darwinSystem {
          inherit system;
          modules = attrValues self.darwinModules ++ [
            ./configuration.nix
            home-manager.darwinModules.home-manager
            {
              nixpkgs = pkgs;
              # `home-manager` config
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.users.bohendo = import ../user/home.nix;            
            }
          ];
          specialArgs = { inherit inputs; };
        };

      };
    };

}
