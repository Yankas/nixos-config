{ config, lib, ... }: 
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

  options = {
    hyprland.enable = lib.mkEnableOption "enable custom hyprland config";

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