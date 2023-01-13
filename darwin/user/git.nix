{ config, inputs, pkgs, ... }:
{

  programs.git = {
    enable = true; # does this do anything?
    diff-so-fancy.enable = true;
    ignores = [ "*.swp" ];
    signing = {
      key = "8779E612DC487AF7";
      signByDefault = true;
    };
    userEmail = "noreply@gmail.com";
    userName = "bohendo";
  };

}
