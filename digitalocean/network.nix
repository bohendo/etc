{

  network = {
    pkgs = import
      (builtins.fetchGit {
       name = "nixos-unstable-2022-11-14";
       url = "https://github.com/NixOS/nixpkgs";
       rev = "b68a6a27adb452879ab66c0eaac0c133e32823b2";
       ref = "refs/heads/nixos-22.05";
      })
      { };
  };

  bohendo = { modulesPath, lib, name, pkgs, ... }: {
    imports = lib.optional (builtins.pathExists ./do-userdata.nix) ./do-userdata.nix ++ [
      (modulesPath + "/virtualisation/digital-ocean-config.nix")
    ];

    system.stateVersion = "22.05";

    deployment.targetHost = "0.0.0.0"; # TODO: replace with real IPv4
    deployment.targetUser = "root";

    networking.hostName = name;
    networking.firewall.allowedTCPPorts = [ 80 443 ];

    # Define a user account. Don't forget to set a password with ‘passwd’.
    users.users.admin = {
      isNormalUser = true;
      description = "Administrator";
      extraGroups = [ "wheel" "docker" ];
      packages = [ ];
    };

    virtualisation.docker = {
      enable = true;
      liveRestore = false; # defaults to true but is incompatible with docker swarm mode
    };

    # Set your time zone.
    time.timeZone = "America/Indiana/Indianapolis";

    # List packages installed in system profile.
    environment.systemPackages = with pkgs; [
      curl
      docker
      git
      gnumake
      gnupg
      jq
      lshw
      tree
      vim
      wget
    ];

  };

}
