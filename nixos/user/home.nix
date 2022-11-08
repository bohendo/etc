{ config, inputs, pkgs, ... }:
{

  imports = [
    ./browsers.nix
    ./editors.nix
    ./shells.nix
  ];

  programs.home-manager.enable = true;

  # install readline to configure inputrc?

  programs.dircolors.enable = true;

  home = {
    username = "bohendo";
    homeDirectory = "/home/bohendo";
    packages = with pkgs; [
      bat
      blender
      calibre
      exiftool
      ffmpeg
      gimp
      gnome.pomodoro
      inkscape
      keepassxc
      obsidian
      pandoc
      pstree
      pylint
      tmux
    ];
  };

}
