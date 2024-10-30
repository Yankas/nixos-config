{ config, pkgs, lib, style, ... }:
let color = {
  background        = "#292B2E";
  background-accent = "#1A1A1A";
  text              = "#FDF6E3";
  text-highlight    = "#FF4221";
}; in
let font =  {
    size         = "20px";
};
in
{
  programs.waybar = lib.mkIf config.hyprland.enable {
    enable = true;
    systemd.enable = true;
    style = ''
      * {
        font-size: ${font.size};
        font-family: "Fighting Spirit turbo", sans-serif
      }

      window#waybar {
        background: ${color.background};
        color: ${color.text};
        border-style: solid;
        border-color: ${color.background-accent};
        border-width: 0px 0px 3px 0px
      }

      #custom-right-arrow-dark,
      #custom-left-arrow-dark {
        color: ${style.colors.background-accent};
      }
      #custom-right-arrow-light,
      #custom-left-arrow-light {
        color: ${color.background};
        background: ${color.background-accent};
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
      #tray,
      #bluetooth {
        background: ${color.background-accent};
        text-shadow: 1px 1px #DDD;
      }

      #workspaces button {
        padding: 0px 5px;
        color: ${color.text};
        border-width: 0px;
        background: ${color.background-accent};
      }

      #workspaces button:hover {
        color: ${color.text-highlight};
      }

      #workspaces button.visible {
        color: ${color.text-highlight};
        padding: 0px 7px;
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

      #mpris.icon {
        background-size: 24px 24px;
        background-repeat: no-repeat;
        background-position: 10px 50%;
        margin-left: 0px;
        padding-left: 20px;
        background-color: ${color.background-accent};
      }

      #mpris.icon.playing {
        background-image: url("${config.assets}/waybar-playing.png");
      }

      #mpris.icon.paused {
        background-image: url("${config.assets}/waybar-paused.png");
      }

      #mpris.icon.stopped {
        background-image: url("${config.assets}/waybar-paused.png");
      }

      #mpris {
        font-family: "Die in a fire PG", sans-serif;
        text-shadow: unset;
        padding: 0px 10px;
      }

      #clock, #custom-weather, #bluetooth  {
        font-size: ${font.size};
        color: ${color.text-highlight};
      }

      #clock,
      #pulseaudio,
      #memory,
      #cpu,
      #battery,
      #disk,
      #tray {
        padding: 0px 10px;
      }

      tooltip label {
        font-family: Consolas, monospace;
        font-size: 25px;
      }
    '';

    settings = [{
      height = 30;
      layer = "top";
      position = "top";
      tray = {
        spacing = 10;
      };

      modules-left = [
        "hyprland/workspaces"
        "custom/right-arrow-dark"
        "privacy"
        ];

      modules-center = [
        "custom/left-arrow-dark"
        "custom/left-arrow-light"
        "custom/left-arrow-dark"
        "mpris#icon"
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
        "bluetooth"
        "tray"
      ];
      "custom/weather" = {
        exec = "curl 'wttr.in?format=%t'";
        max-length = 5;
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
            transition-duration = 250;
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
        format = "<span text_transform=\"uppercase\">{:%a}</span>";
        tooltip = false;
        interval = 5;
      };

      # TIME
      "clock#2" = {
        format = "{:%H:%M}";
        tooltip = false;
        interval = 1;
      };

      bluetooth = {
        format = "";
      };


      # DATE
      "clock#3" = {
        format = "{:%m/%d}";
        tooltip = false;
        interval = 5;
        on-click = "date --iso-8601 | tr -d '\n' | ${pkgs.wl-clipboard}/bin/wl-copy";
      };

      pulseaudio = {
        format = "{icon} {volume:2}%";
        format-bluetooth = "{icon}  {volume}%";
        format-muted = "Mute";
        format-icons = {
          headphones = "SFX: ";
          default = [
            "SFX: "
            "SFX: "
          ];
        };
        "scroll-step" = 5;
        "on-click" = "hyprctl dispatch togglespecialworkspace audio";
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

      "mpris#icon" = {
        format = " ";
        player-icons = {
          default = "";
          mpv = "";
        };
        status-icons = {
          "paused" = "";
          "stopped" = "";
        };
        tooltip = false;
      };

      mpris = {
        format = "{title} ";
        format-paused = "{title} ";
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