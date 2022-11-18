{ config, inputs, pkgs, ... }:
{

  imports = [
    ./editors.nix
    ./shells.nix
  ];

  home = {
    username = "bohendo";
    homeDirectory = "/Users/bohendo";
    stateVersion = "22.05";

    # TODO: add links from etc/bin/blah to $HOME/bin/blah
    file = {
      ".inputrc".text = ''
        $include /etc/inputrc
        "\e[A": history-search-backward
        "\e[B": history-search-forward
        set show-all-if-ambiguous on
        set completion-ignore-case on
      '';
      ".gnupg".source = config.lib.file.mkOutOfStoreSymlink /Users/bohendo/.secret/gnupg;
      ".private.env".source = config.lib.file.mkOutOfStoreSymlink /Users/bohendo/.secret/private.env;
      ".ssh".source = config.lib.file.mkOutOfStoreSymlink /Users/bohendo/.secret/ssh;
      etc.source = config.lib.file.mkOutOfStoreSymlink /Users/bohendo/code/bohendo/etc;
      j.source = config.lib.file.mkOutOfStoreSymlink /Users/bohendo/Obsidian/journal;
      n.source = config.lib.file.mkOutOfStoreSymlink /Users/bohendo/Obsidian/notes;
      w.source = config.lib.file.mkOutOfStoreSymlink /Users/bohendo/Obsidian/notes/work;
    };

    packages = with pkgs; [
      bat # pretty cat
      echidna
      go
      graphviz
      nix-bash-completions
      obsidian # note manager
      pandoc # document conversions
      pstree # pretty ps
      slither-analyzer
      solc-select
      yarn
      yarn-bash-completion
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
