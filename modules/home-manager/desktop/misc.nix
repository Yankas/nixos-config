{ config, pkgs, lib, ... }:
{

  options = {
    home.wallpaper = lib.mkOption {
      type = lib.types.str;
      description = "file name of the wallpaper including extension";
      example = "hello.png";
    };
  };


  config = {
    home.wallpaper = lib.mkDefault "default";
  };

}