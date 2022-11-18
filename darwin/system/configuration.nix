{ config, pkgs, ... }:

{
  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget
  environment.systemPackages = with pkgs; [
    echidna
    bash
    bash-completion
    bat
    cmake
    coreutils
    curl
    docker
    git
    gnumake
    gnupg
    go
    graphviz
    gzip
    home-manager
    jq
    neovim
    nmap
    pandoc
    ps
    pstree
    rename
    ruby
    shellcheck
    slither-analyzer
    sqlite
    tree
    vim
    vscode
    wget
    whois
  ];

  # Use a custom configuration.nix location.
  # $ darwin-rebuild switch -I darwin-config=$HOME/.config/nixpkgs/darwin/configuration.nix
  # environment.darwinConfig = "$HOME/.config/nixpkgs/darwin/configuration.nix";

  # Auto upgrade nix package and the daemon service.
  services.nix-daemon.enable = true;
  # nix.package = pkgs.nix;

  nix.settings.allowed-users = [ "root" "bohendo" ];
  nix.settings.trusted-users = [ "root" "bohendo" ];
  # nix.distributedBuilds = true;
  # nix.buildMachines = [{
  #   hostName = "local-linux";
  #   sshKey = "/tmp/nix/insecure_rsa";
  #   sshUser = "root";
  #   system = "x86_64-linux";
  # }];
  nix.extraOptions = ''
    experimental-features = nix-command flakes
  '';

  # Create /etc/zshrc that loads the nix-darwin environment.
  # programs.zsh.enable = true;  # default shell on catalina
  # programs.fish.enable = true;

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 4;
}
