{ inputs,
  outputs,
  lib,
  config,
  pkgs,
  nix-colors,
  style,
  ... }:
{


  programs.git = {
    userEmail = "christopher.sbrisny@gmail.com";
    userName = "yankas";
  };

  home = {
    username = "yankas";
    isSudoer = true;
  };

  hyprland.autostart.onStart = [
      "${pkgs.discord}/bin/discord"
  ];

  programs = {
    discord.enable = true;
    steam.enable = true;
    whatsappweb.enable = true;
  };

  games = {
    nintendo = {
      gba.enable = true;
      ds.enable = true;
    };
  };
}