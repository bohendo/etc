{ config, lib, pkgs, ... }:

let
  machNix = import (builtins.fetchGit {
    url = "https://github.com/DavHau/mach-nix";
    ref = "refs/tags/3.5.0";
  }) { inherit pkgs; };

  defaultPythonEnv = machNix.mkPython {
    requirements = ''
      cryptography
    '';
    providers.cffi = "nixpkgs";
  };

in {
  system.stateVersion = "22.05";
  imports = [
    <nixpkgs/nixos/modules/installer/sd-card/sd-image-aarch64.nix>
  ];
  environment.systemPackages = [ defaultPythonEnv machNix.mach-nix ];
  sdImage.compressImage = false;  # speeds up the build
}
