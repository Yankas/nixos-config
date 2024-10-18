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
      #tray {
        background: #1a1a1a;
        text-shadow: 1px 1px #DDD;
      }

      #workspaces button {
        padding: 0 2px;
        color: #fdf6e3;
      }

      #workspaces button.focused {
        color: #268bd2;
      }

      #workspaces button:hover {
        box-shadow: inherit;
        text-shadow: inherit;
      }
      #workspaces button:hover {
        background: #1a1a1a;
        border: #1a1a1a;
        padding: 0 3px;
      }

      #pulseaudio {
        color: #268bd2;
      }

      #memory {
        color: #2aa198;
      }

      #tray {
        padding: 0px 10px;
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
        font-family: "Fighting Spirit turbo", sans-serif;
        text-shadow: unset;
        font-size: 15px;
      }

      #clock,
      #pulseaudio,
      #memory,
      #cpu,
      #battery,
      #disk {
        padding: 0 10px;
      }

      tooltip label {
        font-family: Consolas, monospace;
        font-size: 25;
      }
    '';

    settings = [{
      height = 30;
      layer = "top";
      position = "top";
      tray = { spacing = 10; };

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
        "cpu"
        "custom/left-arrow-light"
        "custom/left-arrow-dark"
        "battery"
        "custom/left-arrow-light"
        "custom/left-arrow-dark"
        "disk"
        "custom/left-arrow-light"
        "custom/left-arrow-dark"
        "tray"
      ];

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
        on-click = "date --iso-8601 | ${pkgs.wl-clipboard}/bin/wl-copy";
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
        "on-click" = "pamixer -t";
        "on-click-right" = "pavucontrol";
      };
      
      memory = {
        interval = 5;
        format = "Mem {}%";
      };

      cpu = {
        interval = 5;
        format = "CPU: {usage:2}%";
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

      mpris = {
        format = "{player_icon} {title} ";
        format-paused = "{status_icon} {title} ";
        player-icons = {
          default = " ▶";
          mpv = " 🎵";
        };
        status-icons = {
          "paused" = " ⏸️";
        };
        tooltip = false;
      };

      disk = {
        interval = 5;
        format = "SSD: {percentage_used:2}%";
        path = "/";
      };
      tray = {
        icon-size = 25;
      };

    }];
  };
}