{
  description = "Bo's system configuration";

  inputs = {
    nixpkgs = { url = "github:nixos/nixpkgs/nixos-unstable"; };
    home-manager = { url = "github:nix-community/home-manager"; };
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

      nixosConfigurations = {
        nixos = lib.nixosSystem {
          inherit system;
          modules = [
            # { nixpkgs.overlays = [ emacs-overlay.overlay ];}
            # { nixpkgs.overlays = [ nur.overlay inputs.emacs-overlay.overlay inputs.discord-flake.overlay ]; }
            ./nixos/system/configuration.nix
            # hyprland.nixosModules.default
            # { programs.hyprland.enable = true; }
          ];
          specialArgs = { inherit inputs; };
        };
      };

    };

}
