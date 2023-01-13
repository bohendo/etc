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

  bohendo-com = { modulesPath, lib, name, pkgs, ... }: {
    imports = lib.optional (builtins.pathExists ./do-userdata.nix) ./do-userdata.nix ++ [
      (modulesPath + "/virtualisation/digital-ocean-config.nix")
    ];

    system.stateVersion = "22.05";

    deployment.targetUser = "root";
    deployment.targetHost = "0.0.0.0"; # TODO: replace with real IPv4

    networking.hostName = name;
    networking.firewall.allowedTCPPorts = [ 80 443 ];

    # Define a user account. Don't forget to set a password with ‘passwd’.
    users.users.admin = {
      isNormalUser = true;
      description = "Administrator";
      extraGroups = [ "wheel" "docker" ];
      packages = [ ];
      openssh.authorizedKeys.keys = [
        ''${builtins.readFile ./bohendo.pub}''
      ];
    };

    virtualisation.docker = {
      enable = true;
      liveRestore = false; # defaults to true but is incompatible with docker swarm mode
    };

    services.openssh = {
      enable = true;
      # require public key authentication for better security
      passwordAuthentication = false;
      kbdInteractiveAuthentication = false;
    };

    # Set your time zone.
    time.timeZone = "America/Indiana/Indianapolis";

    # List packages installed in system profile.
    environment.systemPackages = with pkgs; [
      bash
      bat
      curl
      docker
      git
      gnumake
      gnupg
      jq
      lshw
      pstree
      tree
      vim
      wget
    ];

    programs.git = {
      enable = true;
      config = {
        init = {
          defaultBranch = "main";
        };
        user = { email = "noreply@gmail.com"; }; # TODO: replace with real email
        user = { name = "bohendo"; };
      };
    };

    programs.vim = {
      defaultEditor = true;
    };

    programs.bash = {
      interactiveShellInit = ''
        EDITOR="vim"
        CI_PROJECT_NAMESPACE="bohendo"
      '';
      shellAliases = {
        ".." = "cd ..";
        "..." = "cd ../..";
        "...." = "cd ../../..";
        "....." = "cd ../../../..";
        "......" = "cd ../../../../..";
        "......." = "cd ../../../../../..";
        "dls" = "docker service ls && echo '=====' && docker container ls -a";
        "du" = "du -hs";
        "dus" = "du -hs * | sort -h";
        "gba" = "git branch -l --sort=-committerdate --format='%(HEAD) %(color:red)%(objectname:short)%(color:reset) %(color:yellow)%(refname:short)%(color:reset) %(color:green)(%(committerdate:relative))%(color:reset) by%(color:blue bold) %(authorname)%(color:reset) - %(contents:subject)' && echo '  =====' && git branch -r --sort=-committerdate --format='%(HEAD) %(color:red)%(objectname:short)%(color:reset) %(color:yellow)%(refname:short)%(color:reset) %(color:green)(%(committerdate:relative))%(color:reset) by%(color:blue bold) %(authorname)%(color:reset) - %(contents:subject)'";
        "gcaan" = "git commit --all --amend --no-edit";
        "gcan" = "git commit --amend --no-edit";
        "gfa" = "git fetch --all";
        "git-stealth-rebase" = "git -c rebase.instructionFormat='%s%nexec GIT_COMMITTER_DATE=\"%cD\" git commit --amend --no-edit --date=\"%cD\"' rebase -i";
        "gitl" = "git log --graph --decorate --pretty=format:'%Cred%h%Creset %Cgreen(%cr) %C(bold blue)<%an>%Creset%C(yellow)%d%Creset %s %Creset' --abbrev-commit -20";
        "gitla" = "git log --graph --decorate --pretty=format:'%Cred%h%Creset %Cgreen(%cD) %C(bold blue)<%an>%Creset%C(yellow)%d%Creset %s %Creset' --abbrev-commit --branches --remotes --tags";
        "gls" = "git log --graph --pretty=format:'%Cred%h%Creset %Cgreen(%cr) %C(bold blue)<%an>%Creset%C(yellow)%d%Creset %s %Creset' --abbrev-commit --branches --remotes --tags -10 && echo ======= && git status -s";
        "gr" = "grep --exclude=*.swp --exclude-dir=.git --color=auto -r";
        "grep" = "grep --exclude=*.swp --color=auto";
        "l" = "ls --color";
        "la" = "ls -A --color";
        "ll" = "ls -alF --color";
        "logs" = "bash ops/logs.sh";
        "ls" = "ls --color";
        "pse" = "pstree";
        "pst" = "pstree -h $(whoami)";
        "sl" = "ls --color";
        "sudo" = "sudo";
        "sudov" = "sudo vim";
        "t" = "tree -C --filelimit 50 --dirsfirst";
        "te" = "tree -C --filelimit 50 --dirsfirst -p -D --si -f -i --du";
        "trim" = "sed -e 's/[[:space:]]*$//g'";
        "v" = "vim";
      };
    };

  };

}
