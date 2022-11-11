{ config, pkgs, ... }:
{

  imports =
    [
      ./base.nix # core configuration.nix
      ./system76-hardware.nix # device-specific config
    ];

  networking.hostName = "system76";

}
