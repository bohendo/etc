{ config, pkgs, ... }:

{
  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget
  environment.systemPackages = with pkgs; [
    bash
    neovim
    nmap
    ps
    pandoc
    ruby
    bash-completion
    vscode
    bat
    cmake
    coreutils
    curl
    docker
    #echidna # broken
    git
    gnumake
    gnupg
    go
    home-manager
    jq
    nmap
    pstree
    shellcheck
    slither-analyzer
    tree
    vim
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
