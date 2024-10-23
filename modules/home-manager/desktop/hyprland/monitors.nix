{ config, pkgs, lib, ... }:
{
  options = with lib; {
    hyprland.monitors = {
      layout = mkOption {
        default = "single";
        type = with types; nullOr ( enum[ "single" "dual" "dual+ext"]);
      };
      primary = mkOption {
        default = "DP-1";
        type = with types; str;
      };
      secondary = mkOption {
        default = "DP-2";
        type = with types; str;
      };
    };
  };
  config = lib.mkIf hyprland.enable  {
    wayland.windowManager.hyprland.settings = {

    };
  };

  
}