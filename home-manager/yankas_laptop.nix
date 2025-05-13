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

  laptopMode.enable = true;
  waybar.fontsize = 14;
  waybar.height = 20;

  home = {
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
}
