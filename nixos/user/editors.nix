{ config, inputs, pkgs, ... }:
{
  programs = {

    neovim = {
      enable = true;
      extraConfig = ''
        ${builtins.readFile ../../vimrc}
      '';
      plugins = with pkgs.vimPlugins; [
        nerdtree
        supertab
        syntastic
        tcomment_vim
        vim-addon-nix
        vim-javascript
        vim-jsx-typescript
        vim-nix
        vim-solidity
      ];
      vimAlias = true;
    };

  };
}
