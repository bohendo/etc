{ config, pkgs, ... }:
{

  imports = [
    ./base.nix # core configuration.nix
    ./dropbox.nix # core configuration.nix
    ./system76-hw.nix # device-specific config
  ];

  networking.hostName = "system76";

  # services.openvpn.servers = {
  #   pr = {
  #     config = '' config /home/bohendo/openvpn/pr-proton.udp.ovpn '';
  #     updateResolvConf = false;
  #     autoStart = false;
  #   };
  # };

  environment.systemPackages = with pkgs; [
    protonvpn-gui
  ];

  virtualisation.libvirtd.enable = true;
  users.extraGroups.libvirtd.members = [ "bohendo" ];
  boot.extraModprobeConfig = ''
    options kvm_intel nested=1
    options kvm_intel emulate_invalid_guest_state=0
    options kvm ignore_msrs=1
  '';

  virtualisation.virtualbox.host.enable = true;
  users.extraGroups.vboxusers.members = [ "bohendo" ];

}
