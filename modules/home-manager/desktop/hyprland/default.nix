{ config, lib, pkgs, ... }: 
let
    set-bg = pkgs.writeShellScriptBin "set-bg" ''
      ${pkgs.swaybg}/bin/swaybg -i /run/current-system/sw/share/wallpapers/$1
    '';
in
{

   imports = [
    ./hyprland.nix
    ./waybar.nix
  ];

  let color = {
  background        = "#292B2E";
  background-accent = "#1A1A1A";
  text              = "#FDF6E3";
  text-highlight    = "#FF4221";
};

  options = {
    hyprland.enable = lib.mkEnableOption "enable custom hyprland config";
    hyprland.disableHardwareCursor = lib.mkEnableOption  "disable the hardware cursor";

    hyprland.autostart.onStart = lib.mkOption {
       type = with lib.types; listOf str;
       description = "list of commands to run when hyprland first initializes";
       default = [];
    };
    hyprland.autostart.onReload = lib.mkOption {
       type = with lib.types; listOf str;
       description = "list of commands to every time hyprland reloads";
       default = [ 
        "${set-bg}/bin/set-bg ${config.home.wallpaper}"
       ];
    };


    
  };
}