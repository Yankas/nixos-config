{ config, pkgs, lib, ... }:
{

  options = {
    home.wallpaper = lib.mkOption {
      type = lib.types.str;
      description = "file name of the wallpaper including extension";
      default = "default";
      example = "hello.png";
    };
  };
}