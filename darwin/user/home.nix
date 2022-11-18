{ config, inputs, pkgs, ... }:
{

  imports = [
    # ./editors.nix
    # ./shells.nix
  ];

  home = {
    username = "bohendo";
    homeDirectory = "/home/bohendo";
    stateVersion = "22.05";

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
      etc.source = config.lib.file.mkOutOfStoreSymlink /home/bohendo/code/bohendo/etc;
    };

    packages = with pkgs; [
      bat # pretty cat
      obsidian # note manager
      pandoc # document conversions
      pstree # pretty ps
    ];

  };

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

}
