{ config, inputs, pkgs, ... }:
{

  imports = [
    ./editors.nix
  ];

  programs.home-manager.enable = true;

  home = {
    username = "bohendo";
    homeDirectory = "/home/bohendo";
    packages = [
      pkgs.ffmpeg
    ];
  };

}
