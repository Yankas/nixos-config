{ inputs,
  outputs,
  lib,
  config,
  pkgs,
  nix-colors,
  style,
  ... }:
{
    imports = [
      outputs.homeManagerModules.common
      outputs.homeManagerModules.desktop
      inputs.nix-colors.homeManagerModules.default
      ./desktop_common.nix
      ./yankas_common.nix
    ];

  home = {
    stateVersion = "24.05";
    packages = with pkgs; [
      whipper
      strawberry
      body-utils
      d2r-tools
      bottles
      solaar
    ];
    wallpaper = "hgss.png";
  };

  monitors = {
    primary = "DP-2";
    secondary = "DP-1";
    external = "HDMI-A-1";
  };


  programs = {
    torrent.enable = true;
  };

  games = {
    saves.enable = true;
    minecraft.enable = true;
    thesims4-updater.enable = true;
    ps3.enable = true;
    psp.enable = true;
    nintendo = {
      switch.enable = true;
      _3ds.enable = true;
    };
  };


  #waybar.fontsize = 14;
  #waybar.height = 20;
  #laptopMode.enable = true;
  hyprland.autostart.onStart = [
      "steam"
      "${pkgs.discord}/bin/discord"
      "qbittorrent"
      "easyeffects"
  ];

  wayland.windowManager.hyprland.settings = {
    monitor = [
      "$m_left, 2560x1440@144, 0x0, 1, vrr, 2"
      "$m_right, 2560x1440@144, 2560x0, 1, vrr, 2"
    ];
  };

  gtk = {
    #font = {
    #  name = "Die in a fire PG";
    #  size = 12;
    #};
  };

  desktop.nasBookmarks.enable = true;


}
