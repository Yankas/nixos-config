{ config, pkgs, lib, ... }:
{



  config = {
    home.file {
      ".local/share/NeposGames/Nebuchadnezzar" = config.lib.file.mkOutOfStoreSymlink "/home/${config.home.username}/.saves/
    };
  };
}