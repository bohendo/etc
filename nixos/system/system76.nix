{ config, pkgs, ... }:
{

  imports =
    [
      ./base.nix # core configuration.nix
      ./system76-hw.nix # device-specific config
    ];

  networking.hostName = "system76";

}
