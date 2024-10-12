{ config, pkgs, lib, ... }:
let
  link = config.lib.file.mkOutOfStoreSymlink;
in
{
  config = {
    home.file = {
      ".local/share/NeposGames/Nebuchadnezzar".source = link "${config.home.homeDirectory}/.saves/Nebuchadnezzar";
    };
  };
}