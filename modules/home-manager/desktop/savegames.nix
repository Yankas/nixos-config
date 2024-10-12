{ config, pkgs, lib, ... }:
{
  options = {
    programs.nintendo.gba.enable = lib.mkEnableOption "enables nintendo ds emulator";
    programs.nintendo.ds.enable = lib.mkEnableOption "enables nintendo ds emulator";
    programs.nintendo.switch.enable = lib.mkEnableOption "enables nintendo switch emulator";
    programs.nintendo.swith-utils.enable = lib.mkEnableOption "enables tools to flash switch";
  };


  config = {
    home.packages = with pkgs;
    (if config.programs.nintendo.ds.enable then [ melonDS ] else [])
    ++ (if config.programs.nintendo.switch.enable then [ ryujinx ] else [])
    ++ (if config.programs.nintendo.gba.enable then [ mgba ] else []);
  };
}