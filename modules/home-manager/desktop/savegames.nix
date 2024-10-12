{ config, pkgs, lib, ... }:
let
  link = config.lib.file.mkOutOfStoreSymlink;
in
{
  config = {
    home.file = {
      ".local/share/NeposGames/Nebuchadnezzar".source = link "/home/${config.home.username}/.saves/Nebuchadnezzar";
    };
  };
}