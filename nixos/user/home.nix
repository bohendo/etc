{ config, inputs, pkgs, ... }:
{

  imports = [
    ./browsers.nix
    ./editors.nix
    ./shells.nix
  ];

  services.dropbox.enable = true;

  programs.home-manager.enable = true;

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
    file = {
      ".inputrc".source = ../../inputrc;
      j.source = config.lib.file.mkOutOfStoreSymlink /home/bohendo/Obsidian/journal;
      n.source = config.lib.file.mkOutOfStoreSymlink /home/bohendo/Obsidian/notes;
      b.source = config.lib.file.mkOutOfStoreSymlink /home/bohendo/Obsidian/blog;
      Media.source = config.lib.file.mkOutOfStoreSymlink /mnt/disk/Media;
    };
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
