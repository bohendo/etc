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
        vim-abolish
        vim-addon-nix
        vim-javascript
        vim-nix
        vim-solidity
      ];
    };

    vscode = {
      enable = true;
      enableExtensionUpdateCheck = false;
      enableUpdateCheck = false;
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
        mads-hartmann.bash-ide-vscode
        naumovs.color-highlight
        ms-azuretools.vscode-docker
        mikestead.dotenv
        haskell.haskell
        oderwat.indent-rainbow
        yzhang.markdown-all-in-one
        ms-python.python
        ms-vscode-remote.remote-ssh
        # TODO: improved sarif viewer
        vscodevim.vim
        # TODO: WeAudit
      ] ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
        {
          name = "solidity-visual-auditor";
          publisher = "tintinweb";
          version = "0.1.4";
          sha256 = "sha256-Q+ul9tBnNDf0eDM7YrNMS+c9l2bqI7hIbIxeVGbgW8U=";
        }
        {
          name = "vscode-vyper";
          publisher = "tintinweb";
          version = "0.0.15";
          sha256 = "sha256-I2+/OSCLK5Nu0o7hdhlr17j6VkfnMVLz4mGsM/g2mRU=";
        }
      ];
    };

  };
}
