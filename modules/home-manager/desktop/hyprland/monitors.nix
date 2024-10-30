{ config, pkgs, lib, ... }:
{
  options = with lib; {
    hyprland.monitors = {
      layout = mkOption {
        default = "single";
        type = with types; enum[ "single" "dual"];
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
  config = lib.mkIf config.hyprland.enable  {
    wayland.windowManager.hyprland.settings = {
      
      

    };
  };

  
}