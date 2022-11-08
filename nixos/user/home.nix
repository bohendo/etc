{ config, inputs, pkgs, ... }:
{

  imports = [
    ./editors.nix
    ./shells.nix
  ];

  programs.home-manager.enable = true;

  home = {
    username = "bohendo";
    homeDirectory = "/home/bohendo";
    packages = with pkgs; [
      bat
      blender
      calibre
      exiftool
      ffmpeg
      firefox
      gimp
      gnome.pomodoro
      inkscape
      keepassxc
      obsidian
      pstree
    ];
  };

}
