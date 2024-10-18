{ config, pkgs, lib, ... }:
{
    programs.waybar = {
    enable = true;
    systemd.enable = true;
    style = ''
      * {
        font-size: 20px;
        font-family: "Fighting Spirit turbo", sans-serif
      }

      window#waybar {
        background: #292b2e;
        color: #fdf6e3;
        border-style: solid;
        border-color: #1a1a1a;
        border-width: 0px 0px 0px 0px
      }

      #custom-right-arrow-dark,
      #custom-left-arrow-dark {
        color: #1a1a1a;
      }
      #custom-right-arrow-light,
      #custom-left-arrow-light {
        color: #292b2e;
        background: #1a1a1a;
      }

      #workspaces,
      #clock.1,
      #clock.2,
      #clock.3,
      #pulseaudio,
      #memory,
      #cpu,
      #battery,
      #disk,
      #mpris,
      #custom-weather,
      #tray {
        background: #1a1a1a;
        text-shadow: 1px 1px #DDD;
      }

      #custom-weather {
        font-size: 20px;
      }

      #workspaces button {
        padding: 0px 3px;
        color: #fdf6e3;
      }

      #workspaces button:hover {
        color: #FF4221;
        padding: 0px 3px;
      }

      #workspaces button.visible {
        color: #FF4221;
        padding: 0px 5px;
      }


      #pulseaudio {
        color: #268bd2;
      }

      #memory {
        color: #2aa198;
      }
      
      #cpu {
        color: #6c71c4;
      }

      #battery {
        color: #859900;
      }

      #disk {
        color: #b58900;
      }

      #mpris {
        font-family: "Die in a fire PG", sans-serif;
        text-shadow: unset;
        font-size: 20px;
        padding: 0px 10px;
      }

      #clock {
        color: #FF4221;
      }

      #clock,
      #pulseaudio,
      #memory,
      #cpu,
      #battery,
      #disk,
      #tray {
        padding: 0 10px;
      }

      tooltip label {
        font-family: Consolas, monospace;
        font-size: 25;
      }
    '';

    settings = [{
      height = 28;
      layer = "top";
      position = "top";
      tray = { 
        spacing = 10; 
      };

      modules-left = [ 
        "hyprland/workspaces" 
        "custom/right-arrow-dark"
        ];

      modules-center = [
        "custom/left-arrow-dark"
        "custom/left-arrow-light"
        "custom/left-arrow-dark"
        "mpris"
        "custom/right-arrow-dark"
        "custom/right-arrow-light"
        "custom/right-arrow-dark"
      ];
      modules-right = [
        # CLOCK
        "custom/left-arrow-dark"
        "clock#1"
        "custom/left-arrow-light"
        "custom/left-arrow-dark"
        "clock#2"
        "custom/right-arrow-dark"
        "custom/right-arrow-light"
        "clock#3"

        "custom/left-arrow-light"
        "custom/left-arrow-dark"
        "custom/left-arrow-light"
        "custom/left-arrow-dark"

        "pulseaudio"
        "custom/left-arrow-light"
        "custom/left-arrow-dark"
        #"memory"
        #"custom/left-arrow-light"
        #"custom/left-arrow-dark"
        "group/hardware"
        #"battery"
        #"custom/left-arrow-light"
        #"custom/left-arrow-dark"
        #"battery"
        "custom/left-arrow-light"
        "custom/left-arrow-dark"
        "custom/weather"
        "custom/left-arrow-light"
        "custom/left-arrow-dark"
        "tray"
      ];
      "custom/weather" = {
        exec = "curl 'wttr.in?format=%t'";
        interval = 360;
      };
      "group/hardware" = {
          orientation = "horizontal";
          modules = [
            "cpu"
            "custom/left-arrow-light"
            "custom/left-arrow-dark"
            "disk"
            "custom/left-arrow-light"
            "custom/left-arrow-dark"
            "memory"
          ];
          drawer = {
            transition-duration = 500;
            transition-left-to-right = true;
            #children-class = "drawer";
            click-to-reveal = true;
          };
      };

      "custom/left-arrow-dark" = {
        "format" = "";
        "tooltip" = false;
      };
      "custom/left-arrow-light" = {
        "format" = "";
        "tooltip" = false;
      };
      "custom/right-arrow-dark" = {
        "format" = "";
        "tooltip" = false;
      };
      "custom/right-arrow-light" = {
        "format" = "";
        "tooltip" = false;
      };

      # DAY OF THE WEEK
      "clock#1" = {
        format = "{:%a}";
        tooltip = false;
      };

      # TIME
      "clock#2" = {
        format = "{:%H:%M}";
        tooltip = false;
      };

      # DATE
      "clock#3" = {
        format = "{:%m/%d}";
        tooltip = false;
        on-click = "date --iso-8601 | tr -d '\n' | ${pkgs.wl-clipboard}/bin/wl-copy";
      };

      pulseaudio = {
        format = "{icon} {volume:2}%";
        format-bluetooth = "{icon}  {volume}%";
        format-muted = "MUTE";
        format-icons = {
          headphones = "SFX: ";
          default = [
            "SFX: "
            "SFX: "
          ];
        };
        "scroll-step" = 5;
        "on-click" = "${pkgs.pavucontrol}/bin/pavucontrol";
      };
      
      memory = {
        interval = 5;
        format = "Mem {}%";
        tooltip = false;
      };

      cpu = {
        interval = 5;
        format = "CPU: {usage:2}%";
        tooltip = false;
      };

      battery = {
        states = {
          good = 95;
          warning = 30;
          critical = 15;
        };
        format = "{icon} {capacity}%";
        format-icons = [
          ""
          ""
          ""
          ""
          ""
        ];
      };

      "hyprland/workspaces" = {
        show-special = true;
        special-visible-only = true;
      };

      mpris = {
        format = "{player_icon} {title} ";
        format-paused = "{status_icon} {title} ";
        player-icons = {
          default = " ▶️ ";
          mpv = " 🎵";
        };
        status-icons = {
          "paused" = "⏸️ ";
        };
        tooltip = false;
      };

      disk = {
        interval = 5;
        format = "SSD: {percentage_used:2}%";
        path = "/";
        tooltip = false;
      };
      tray = {
        icon-size = 25;
      };

    }];
  };
}