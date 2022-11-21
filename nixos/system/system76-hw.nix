# Do not modify this file!  It was generated by ‘nixos-generate-config’
# and may be overwritten by future invocations.  Please make changes
# to /etc/nixos/configuration.nix instead.
{ config, lib, pkgs, modulesPath, ... }:

let
  # nvidia config from https://github.com/Swalawaga/nix-dotfiles/blob/main/configuration.nix
  nvidia-offload = pkgs.writeShellScriptBin "nvidia-offload" ''
    export __NV_PRIME_RENDER_OFFLOAD=1
    export __NV_PRIME_RENDER_OFFLOAD_PROVIDER=NVIDIA-G0
    export __GLX_VENDOR_LIBRARY_NAME=nvidia
    export __VK_LAYER_NV_optimus=NVIDIA_only
    exec -a "$0" "$@"
  '';
in

{
  imports =
    [ (modulesPath + "/installer/scan/not-detected.nix")
    ];

  boot.initrd.availableKernelModules = [ "xhci_pci" "nvme" "usb_storage" "sd_mod" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-intel" ];

  ########################################
  # Configure drivers for nvidia GPU

  hardware.system76.enableAll = true;

  environment.systemPackages = with pkgs; [
    zenith-nvidia
    glxinfo
    pciutils
    glmark2
  ];

  /*
  # boot.extraModulePackages = [ pkgs.linuxPackages.nvidia_x11.latest ];

  hardware.opengl = {
    enable = true;
    # extraPackages = [ pkgs.mesa.drivers ];
    driSupport32Bit = true;
  };

  services.xserver.videoDrivers = [ "nvidia" ];

  environment.systemPackages = with pkgs; [
    nvidia-offload
    linuxPackages.nvidia_x11
  ];

  specialisation = {
    external-display.configuration = {
      system.nixos.tags = [ "external-display" ];
      hardware.nvidia.prime.offload.enable = lib.mkForce false;
      hardware.nvidia.powerManagement.enable = lib.mkForce false;
    };
  };

  # boot.blacklistedKernelModules = [ "nouveau" ]; # "nvidia_drm" "nvidia_modeset" "nvidia" ];
  hardware.nvidia = {
    modesetting.enable = true;
    package = config.boot.kernelPackages.nvidiaPackages.beta;
    nvidiaPersistenced = true;
    prime = {
      offload.enable = true; # gpu on demand
      sync.enable = false; # gpu always
      intelBusId = "PCI:0:2:0";
      nvidiaBusId = "PCI:1:0:0";
    };
  };

  services.xserver = {
    screenSection = ''
      Option         "metamodes" "nvidia-auto-select +0+0 {ForceFullCompositionPipeline=On}"
      Option         "AllowIndirectGLXProtocol" "off"
      Option         "TripleBuffer" "on"
    '';
    deviceSection = ''
      #Identifier "Nvidia Card"
      #Driver "nvidia"
      Option "VirtualHeads" "3"
    '';
    exportConfiguration = true;
  };
  */

  ########################################
  # Configure filesystems & disk mounts

  fileSystems."/" =
    { device = "/dev/disk/by-uuid/1bfd36df-5cd9-43ac-a8f9-9cd4a3033a95";
      fsType = "ext4";
    };

  fileSystems."/boot/efi" =
    { device = "/dev/disk/by-uuid/A3A1-D75F";
      fsType = "vfat";
    };

  swapDevices =
    [ { device = "/dev/disk/by-uuid/f98e31c1-d860-4540-84b8-cfda0c2b287a"; }
    ];

  ########################################
  # Misc config

  # Enables DHCP on each ethernet and wireless interface. In case of scripted networking
  # (the default) this is the recommended approach. When using systemd-networkd it's
  # still possible to use this option, but it's recommended to use it in conjunction
  # with explicit per-interface declarations with `networking.interfaces.<interface>.useDHCP`.
  networking.useDHCP = lib.mkDefault true;
  # networking.interfaces.enp36s0.useDHCP = lib.mkDefault true;
  # networking.interfaces.wlp0s20f3.useDHCP = lib.mkDefault true;

  powerManagement.cpuFreqGovernor = lib.mkDefault "performance";
  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
