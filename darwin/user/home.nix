{ config, inputs, pkgs, ... }:
{

  imports = [
    ./editors.nix
    ./git.nix
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
      trufflehog
      # echidna # install from local source
      # semgrep # not supported on M1 yet
      graphviz
      obsidian # note manager
      pandoc # document conversions
      slither-analyzer
      solc-select
    ];

  };

  programs.home-manager.enable = true;

}
