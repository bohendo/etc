{ config, pkgs, ... }:
{

  imports =
    [
      ./base.nix # core configuration.nix
      ./system76-hw.nix # device-specific config
    ];

  networking.hostName = "system76";

  services.xserver.videoDriver = "nvidia";
  hardware.opengl.enable = true;

  # hardware.nvidia.package = config.boot.kernelPackages.nvidiaPackages.stable;

}
