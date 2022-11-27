{ config, inputs, pkgs, ... }:
{

  imports = [
    ./browsers.nix
    ./editors.nix
    ./git.nix
    ./shells.nix
  ];

  programs.home-manager.enable = true;

  home = {
    username = "bohendo";
    homeDirectory = "/home/bohendo";

    file = {
      ".inputrc".text = ''
        $include /etc/inputrc
        "\e[A": history-search-backward
        "\e[B": history-search-forward
        set show-all-if-ambiguous on
        set completion-ignore-case on
      '';
      j.source = config.lib.file.mkOutOfStoreSymlink /home/bohendo/Obsidian/journal;
      n.source = config.lib.file.mkOutOfStoreSymlink /home/bohendo/Obsidian/notes;
      b.source = config.lib.file.mkOutOfStoreSymlink /home/bohendo/Obsidian/blog;
      ".ssh".source = config.lib.file.mkOutOfStoreSymlink /home/bohendo/.secret/ssh;
      ".gnupg".source = config.lib.file.mkOutOfStoreSymlink /home/bohendo/.secret/gnupg;
      ".private.env".source = config.lib.file.mkOutOfStoreSymlink /home/bohendo/.secret/private.env;
      etc.source = config.lib.file.mkOutOfStoreSymlink /home/bohendo/code/etc;
    };

    packages = with pkgs; [
      blender # 3D model editor
      calibre # ebook manager
      qbittorrent # file downloader
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
      nodejs-18_x
      obsidian # note manager
      pandoc # document conversions
      runelite # fun
      sqlite # simple db
      virt-manager
      vlc # video viewer
      xclip # system clipboard bindings
    ];

  };

}
