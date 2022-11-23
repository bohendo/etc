{ config, pkgs, ... }:
{

  imports =
    [
      ./base.nix # core configuration.nix
      ./dropbox.nix # core configuration.nix
      ./system76-hw.nix # device-specific config
    ];

  networking.hostName = "system76";

  virtualisation.virtualbox.host.enable = true;
  virtualisation.libvirtd.enable = true;
  users.extraGroups.vboxusers.members = [ "bohendo" ];

}
