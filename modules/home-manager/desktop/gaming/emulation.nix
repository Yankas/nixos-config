{ config, pkgs, lib, ... }:
let switch-flash = pkgs.writeShellScriptBin "switch-flash" ''
  $XDG_DATA_HOME/fusee-launcher/fusee-launcher.py $XDG_CONFIG_HOME/fusee-launcher/payload/fusee-primary.bin
  '';
in
{
  options = {
    games.nintendo.gba.enable = lib.mkEnableOption "enables nintendo ds emulator";
    games.nintendo.ds.enable = lib.mkEnableOption "enables nintendo ds emulator";
    games.nintendo.switch.enable = lib.mkEnableOption "enables nintendo switch emulator";
    games.nintendo.switch-utils.enable = lib.mkEnableOption "enables tools to flash switch";
  };


  config = {
    home.packages = with pkgs;
    (if config.games.nintendo.ds.enable then [ melonDS ] else [])
    ++ (if config.games.nintendo.switch.enable then [ ryujinx ] else [])
    ++ (if config.games.nintendo.gba.enable then [ mgba ] else [])
    ++ (if config.games.nintendo.switch-utils.enable then [ switch-flash ] else []);
  };
}