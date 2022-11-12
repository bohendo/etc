{ config, pkgs, ... }:
{

  imports =
    [
      ./base.nix # core configuration.nix
      # ./asus-hardware.nix # device-specific config
    ];

  networking.hostName = "asus";

}
