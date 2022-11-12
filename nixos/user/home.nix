{ config, inputs, pkgs, ... }:
{

  imports = [
    ./browsers.nix
    ./editors.nix
    ./shells.nix
  ];

  home = {
    username = "bohendo";
    homeDirectory = "/home/bohendo";
    file = {
      ".inputrc".source = ../../inputrc;
      j.source = config.lib.file.mkOutOfStoreSymlink /home/bohendo/Obsidian/journal;
      n.source = config.lib.file.mkOutOfStoreSymlink /home/bohendo/Obsidian/notes;
      b.source = config.lib.file.mkOutOfStoreSymlink /home/bohendo/Obsidian/blog;
      etc.source = config.lib.file.mkOutOfStoreSymlink /home/bohendo/code/etc;
      Media.source = config.lib.file.mkOutOfStoreSymlink /mnt/disk/Media;
    };
    packages = with pkgs; [
      bat # pretty cat
      blender # 3D model editor
      calibre # ebook manager
      evince # pdf viewer
      exiftool # image metadata viewer/editor
      ffmpeg # video converter
      gimp # image editor
      gnome.pomodoro
      imagemagick # image converter
      inkscape # svg editor
      keepassxc # password manager
      libheif # converts iphone format to jpeg
      nomacs # image viewer
      obsidian # note manager
      pandoc # document conversions
      pstree # pretty ps
      sqlite # simple db
      vlc # video viewer
      xclip # system clipboard bindings
    ];
  };

  services.dropbox.enable = true;

  programs.home-manager.enable = true;
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

  xdg.mimeApps = {
    enable = true;
    associations.added = {
      "application/pdf" = ["org.gnome.Evince.desktop"];
      "image/jpeg" = ["org.gnome.Nomacs.desktop"];
      "image/png" = ["org.gnome.Nomacs.desktop"];
    };
    defaultApplications = {
      "application/pdf" = ["org.gnome.Evince.desktop"];
      "image/jpeg" = ["org.gnome.Nomacs.desktop"];
      "image/png" = ["org.gnome.Nomacs.desktop"];
    };
  };

}
