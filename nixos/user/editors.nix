{ config, inputs, pkgs, ... }:
{
  programs = {

    neovim = {
      enable = true;
      extraConfig = ''
        ${builtins.readFile ../../vimrc}
      '';
      plugins = with pkgs.vimPlugins; [
        vim-addon-nix
        vim-nix
        nerdtree
        syntastic
        vim-javascript
        vim-jsx-typescript
        vim-solidity
      ];
    };

  };
}
