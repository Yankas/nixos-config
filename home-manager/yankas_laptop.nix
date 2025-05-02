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
    ];

  laptopMode.enable = true;
  waybar.fontsize = 14;
  waybar.height = 20;

  home = {
    username = "yankas";
    isSudoer = true;
    stateVersion = "24.05";
    packages = with pkgs; [
      whipper
      strawberry
      bottles
      solaar
    ];
    wallpaper = "hgss.png";
  };

  monitors = {
    primary = "LVDS-1";
    external = "HDMI-A-1";
  };

  programs = {
    whatsappweb.enable = true;
    discord.enable = true;
    steam.enable = true;
  };

  games = {
    nintendo = {
      gba.enable = true;
      ds.enable = true;
    };
  };

  hyprland.autostart.onStart = [
      "${pkgs.discord}/bin/discord"
  ];

  wayland.windowManager.hyprland.settings = {
    monitor = [
      "$m_left, 1280x800@60, 0x0, 1"
    ];
    input = {
      touchpad = {
        natural_scroll = true;
        clickfinger_behavior = true;
        tap-to-click = true;
      };
    };
  };

  desktop.nasBookmarks.enable = true;


  programs.git = {
    userEmail = "christopher.sbrisny@gmail.com";
    userName = "yankas";
  };

}
