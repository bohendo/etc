{ config, inputs, pkgs, ... }:
{
  programs = {

    bash = {
      enable = true;
      historyControl = [ "ignoredups" "ignorespace" ];
      historyFile = "/home/bohendo/.bash_history";
      historyFileSize = 20000;
      historyIgnore = [ "ls" ];
      sessionVariables = {
        EDITOR = "nvim";
      };
      initExtra = ''
        PS1='\n''${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\n\$ ';
        PATH="$PATH:/home/bohendo/bin"
        if [[ -f "$HOME/.profile" ]]; then source "$HOME/.profile"; fi
      '';
      shellOptions = [ "extglob" "globstar" "histappend" "checkwinsize" ];
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
        "gcan" = "git commit --amend --no-edit";
        "gcaan" = "git commit --all --amend --no-edit";
        "gfa" = "git fetch --all";
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
        "git-stealth-rebase" = "git -c rebase.instructionFormat='%s%nexec GIT_COMMITTER_DATE=\"%cD\" git commit --amend --no-edit --date=\"%cD\"' rebase -i";
        "sudo" = "sudo";
        "sudov" = "sudo nvim";
        "sqlite" = "sqlite3";
        "t" = "tree -C --filelimit 50 --dirsfirst";
        "te" = "tree -C --filelimit 50 --dirsfirst -p -D --si -f -i --du";
        "trim" = "sed -e 's/[[:space:]]*$//g'";
        "v" = "nvim";
      };
    };

  };
}
