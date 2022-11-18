{ config, inputs, pkgs, ... }:
{
  programs = {

    vscode = {
      enable = true;
      enableExtensionUpdateCheck = false;
      userSettings = {
        "files.autoSave" = "off";
        "terminal.integrated.macOptionIsMeta" = true;
        "terminal.external.osxExec" = "bash";
        "terminal.integrated.defaultProfile.osx" = "bash";
        "terminal.integrated.profiles.osx" = {
          "bash" = {
            "path" = "bash";
            "args" = ["-l"];
          };
        };
        "terminal.integrated.env.osx" = {
          "PATH" = "${env:PATH}";
        };
        "sarif-viewer.rootpaths" = [
          "."
        ];
        "solidity.formatter" = "none";
        "solidity.linter" = "";
        "json.maxItemsComputed" = 20000;
      };
      extensions = with pkgs.vscode-extensions; [
        # Missing extensions:
        # - improved sarif viewer
        # - solidity
        # - 
        github.copilot
        haskell.haskell
        mads-hartmann.bash-ide-vscode
        mechatroner.rainbow-csv
        mikestead.dotenv
        ms-azuretools.vscode-docker
        ms-vscode-remote.remote-ssh
        naumovs.color-highlight
        oderwat.indent-rainbow
        ms-python.python
        vscodevim.vim
        yzhang.markdown-all-in-one
      ];
    };

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
