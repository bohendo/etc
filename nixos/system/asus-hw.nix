# Do not modify this file!  It was generated by ‘nixos-generate-config’
# and may be overwritten by future invocations.  Please make changes
# to /etc/nixos/configuration.nix instead.
{ config, lib, pkgs, modulesPath, ... }:

{
  imports =
    [ (modulesPath + "/installer/scan/not-detected.nix")
    ];

  boot.initrd.availableKernelModules = [ "xhci_pci" "ahci" "sd_mod" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-intel" ];
  boot.extraModulePackages = [ ];

  fileSystems."/" =
    { device = "/dev/disk/by-uuid/a81abcff-e64b-4e3a-b5f0-74fbd97a5c8f";
      fsType = "ext4";
    };

  boot.initrd.luks.devices."luks-26758ad4-8bfd-45f8-8d3b-8ae4041f5a9a".device = "/dev/disk/by-uuid/26758ad4-8bfd-45f8-8d3b-8ae4041f5a9a";

  fileSystems."/nix/store" =
    { device = "/nix/store";
      fsType = "none";
      options = [ "bind" ];
    };

  fileSystems."/boot/efi" =
    { device = "/dev/disk/by-uuid/8B1A-5266";
      fsType = "vfat";
    };

  fileSystems."/mnt/disk" =
    { device = "/dev/disk/by-uuid/669bb023-6968-45ed-9e1a-aaf1e3710bd3";
      fsType = "ext4";
    };

  # Enables DHCP on each ethernet and wireless interface. In case of scripted networking
  # (the default) this is the recommended approach. When using systemd-networkd it's
  # still possible to use this option, but it's recommended to use it in conjunction
  # with explicit per-interface declarations with `networking.interfaces.<interface>.useDHCP`.
  networking.useDHCP = lib.mkDefault true;
  # networking.interfaces.docker0.useDHCP = lib.mkDefault true;
  # networking.interfaces.docker_gwbridge.useDHCP = lib.mkDefault true;
  # networking.interfaces.veth1e3bb92.useDHCP = lib.mkDefault true;
  # networking.interfaces.wlp2s0.useDHCP = lib.mkDefault true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  powerManagement.cpuFreqGovernor = lib.mkDefault "powersave";
  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
