{ config, lib, pkgs, ... }: 

{

   imports = [
    ./hyprland.nix
    ./waybar.nix
    ./monitors.nix
  ];
}
