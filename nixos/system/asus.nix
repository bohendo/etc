{ config, pkgs, ... }:
{

  imports =
    [
      ./base.nix # core configuration.nix
      ./asus-hw.nix # device-specific config
    ];

  networking.hostName = "asus";

}
