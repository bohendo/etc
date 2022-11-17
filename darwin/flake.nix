{
  description = "Bo's darwin configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-22.05-darwin";
    darwin.url = "github:lnl7/nix-darwin/master";
    darwin.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { nixpkgs, darwin, ... }@inputs:
    let
      system = "aarch64-darwin";
      pkgs = import nixpkgs {
        inherit system;
        config = { allowUnfree = true; };
      };
      lib = nixpkgs.lib;
    in
    {
      darwinConfigurations = {

        darwin = darwin.lib.darwinSystem {
          inherit system;
          modules = [
            ./configuration.nix
          ];
          specialArgs = { inherit inputs; };
        };

      };
    };

}
