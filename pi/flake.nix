{
  description = "Raspberry Pi 4 Model B Configuration";

  inputs = {
    nixos.url = "github:nixos/nixpkgs/1f4c790f716a7bad8bb000e5cf07e3b5d36a48b8";
    nixos-hardware.url = "github:nixos/nixos-hardware/master";
  };

  outputs = { self, ... }@inputs: with inputs; {
    nixosConfigurations.pi = nixos.lib.nixosSystem {
      system = "aarch64-linux";
      modules = [
        ({modulesPath, ...}: {
          imports = ["${modulesPath}/installer/sd-card/sd-image-aarch64.nix"];
        })
        nixos-hardware.nixosModules.raspberry-pi-4
      ];
    };
  };
}

