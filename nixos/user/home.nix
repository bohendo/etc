{ config, inputs, pkgs, ... }:
{

  imports = [
    ./browsers.nix
    ./editors.nix
    ./shells.nix
  ];

  home.file.".inputrc".source = ../../inputrc;

  programs.home-manager.enable = true;

  # install readline to configure inputrc?

  programs.dircolors.enable = true; # does this do anything?

  programs.git = {
    enable = true; # does this do anything?
    diff-so-fancy.enable = true;
    ignores = [ "*.swp" ];
    signing = {
      key = "8779E612DC487AF7";
      signByDefault = true;
    };
    userEmail = "***REMOVED***";
    userName = "bohendo";
  };

  home = {
    username = "bohendo";
    homeDirectory = "/home/bohendo";
    packages = with pkgs; [
      bat
      blender
      calibre
      evince
      exiftool
      ffmpeg
      gimp
      gnome.pomodoro
      inkscape
      keepassxc
      libheif
      nodePackages.eslint
      obsidian
      pandoc
      pstree
      pylint
      sqlite
      tmux
      vlc
      xclip
    ];
  };

}
