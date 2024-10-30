{ config, pkgs, lib, ... }:
{

  xdg.configFile."fuzzel/fuzzel.ini".text = lib.generators.toINIWithGlobalSection { } {
    globalSection = {
      font = "Die in a fire PG:size=20";
      use-bold = "yes";
      dpi-aware = true;

    };

    sections = {

      border = {
        #width = 1;
        #radius = 10;
      };





    };


  };
}