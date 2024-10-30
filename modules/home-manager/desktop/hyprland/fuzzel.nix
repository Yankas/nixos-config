{ config, pkgs, lib, ... }:
let yes = "yes"; in
let colors = {
  background        = "292B2E";
  background-accent = "1A1A1A";
  text              = "FDF6E3";
  text-highlight    = "FF4221";
}; in
{

  xdg.configFile."fuzzel/fuzzel.ini".text = lib.generators.toINIWithGlobalSection { } {
    globalSection = {
      font = "Die in a fire PG:size=15";
      use-bold = yes;
      dpi-aware = yes;
      icons-enabled = yes;
      #password-character = "*";
      lines = 20;
      # width is in characters
      width = 50;
      # Number of spaces a tab is expanded to 
      tabs = 4;
      exit-on-keyboard-focus-loss = yes;



    };

    sections = {
      colors = {
        # BACKGROUND COLORS
        background = "${colors.background}FF";
        selection = "${colors.background}FF";
        border = "${colors.background-accent}FF";
        # TEXT COLORS
        text = "${colors.text}FF";
        input = "${colors.text-highlight}FF";
        match = "${colors.text}FF";
        selection-text = "${colors.text-highlight}FF";
        selection-match = "${colors.text-highlight}FF";
        counter = "${colors.text-highlight}FF";
      };

      #border = {
      #  #width = 1;
      #  #radius = 10;
      #};





    };


  };
}