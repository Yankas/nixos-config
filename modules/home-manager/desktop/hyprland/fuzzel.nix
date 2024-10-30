{ config, pkgs, lib, ... }:
let yes = "yes"; in
{

  xdg.configFile."fuzzel/fuzzel.ini".text = lib.generators.toINIWithGlobalSection { } {
    globalSection = {
      font = "Die in a fire PG:size=15";
      use-bold = yes;
      dpi-aware = yes;
      icons-enabled = yes;
      #password-character = "*";
      lines = 20;
      width = 50; # in characters



    };

    sections = {

      border = {
        #width = 1;
        #radius = 10;
      };





    };


  };
}