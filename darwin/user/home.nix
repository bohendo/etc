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
      # echidna # install from local source
      # semgrep # not supported on M1 yet
      # slither-analyzer # install from local source
      # solc-select # install from local source
      # vyper # nixpkgs provides 3.6, build from source to get 3.7
      foundry-bin
      graphviz
      just
      obsidian # note manager
      pandoc # document conversions
      trufflehog
    ];

  };

  programs.home-manager.enable = true;

}
