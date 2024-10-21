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






    
}
