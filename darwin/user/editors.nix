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
        vim-abolish
        vim-addon-nix
        vim-javascript
        vim-jsx-typescript
        vim-nix
        vim-solidity
      ];
    };

    vscode = {
      enable = true;
      enableExtensionUpdateCheck = false;
      userSettings = {
        "breadcrumbs.enabled" = true;
        "editor.formatOnSave" = false;
        "editor.minimap.enabled" = false;
        "editor.renderWhitespace" = "all";
        "files.autoSave" = "onFocusChange";
        "files.trimTrailingWhitespace" = true;
        "json.maxItemsComputed" = 20000;
        "sarif-viewer.rootpaths" = [ "." ];
        "solidity.formatter" = "none";
        "solidity.linter" = "";
        "telemetry.enableCrashReporter" = false;
        "telemetry.enableTelemetry" = false;
        "terminal.external.osxExec" = "bash";
        "terminal.integrated.defaultProfile.osx" = "bash";
        "terminal.integrated.env.osx" = { "PATH" = "${env:PATH}"; };
        "terminal.integrated.macOptionIsMeta" = true;
        "terminal.integrated.profiles.osx" = { "bash" = { "path" = "bash"; "args" = ["-l"]; }; };
        "workbench.editor.enablePreview" = false;
        "workbench.iconTheme" = "vscode-icons-mac";
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

  };
}
