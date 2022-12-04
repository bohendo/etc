{ config, inputs, pkgs, ... }:
{
  programs = {

    neovim = {
      enable = true;
      extraConfig = ''
        ${builtins.readFile ../../vimrc}
      '';
      plugins = with pkgs.vimPlugins; [
        hoon-vim
        nerdtree
        supertab
        syntastic
        tcomment_vim
        typescript-vim
        vim-addon-nix
        vim-javascript
        vim-tsx
        vim-nix
        vim-solidity
      ];
      vimAlias = true;
    };

  };
}
