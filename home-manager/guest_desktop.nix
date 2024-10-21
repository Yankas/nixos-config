{ config, pkgs, lib, inputs, outputs, ... }:
{
  imports = [ 
    outputs.homeManagerModules.common
    outputs.homeManagerModules.desktop
    inputs.nix-colors.homeManagerModules.default
  ];

  home = {
    username = "guest";
    homeDirectory = "/home/guest";
    enableNixpkgsReleaseCheck = false;
    stateVersion = "24.05";
    #packages = [];
    #file = {};
    sessionVariables = {
      BROWSER = "chromium"; 
    };
  };

  programs = {
    home-manager.enable = true;
  };

  home.packages = [
  ];
}
