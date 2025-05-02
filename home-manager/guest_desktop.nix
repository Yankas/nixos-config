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
    stateVersion = "24.05";
  };

  programs = {
    home-manager.enable = true;
  };

  home.packages = [
  ];
}
