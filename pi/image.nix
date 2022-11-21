{
  pkgs, modulesPath, lib, ... }: {
  imports = [
    "${modulesPath}/installer/sd-card/sd-image-armv7l-multiplatform.nix"
  ];

  # Needed for https://github.com/NixOS/nixpkgs/issues/58959
  boot.supportedFilesystems = lib.mkForce [ "btrfs" "reiserfs" "vfat" "f2fs" "xfs" "ntfs" "cifs" ];
}
