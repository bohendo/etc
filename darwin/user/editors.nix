{ config, inputs, pkgs, ... }:
{
  programs = {

    neovim = {
      enable = true;
      extraConfig = ''
        ${builtins.readFile ../../vimrc}
      '';
      plugins = with pkgs.vimPlugins; [
        { plugin = nerdtree; config = ""; }
        { plugin = supertab; config = ""; }
        { plugin = syntastic; config = ""; }
        { plugin = vim-addon-nix; config = ""; }
        { plugin = vim-javascript; config = ""; }
        { plugin = vim-jsx-typescript; config = ""; }
        { plugin = vim-nix; config = ""; }
        { plugin = vim-solidity; config = ""; }
      ];
      vimAlias = true;
    };

  };
}
