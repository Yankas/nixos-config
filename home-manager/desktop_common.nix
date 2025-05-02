{ config, pkgs, lib, inputs, outputs, ... }:
{
  hyprland.enable = true;

  home = {
    file = {};
    sessionVariables = {
      BROWSER = "chromium";
    };
    enableNixpkgsReleaseCheck = false;
    packages = with pkgs; [
      libreoffice

    ]
  };

  hyprland.autostart.onStart = [
  ];
}