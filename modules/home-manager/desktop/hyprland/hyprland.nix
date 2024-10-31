{ config, pkgs, lib, ... }:
let color = {
  background        = "292B2E";
  background-accent = "1A1A1A";
  text              = "FDF6E3";
  text-highlight    = "FF4221";
}; in
let set-bg = pkgs.writeShellScriptBin "set-bg" ''
      ${pkgs.swaybg}/bin/swaybg -i /run/current-system/sw/share/wallpapers/$1
    '';
in
let setup-audio-ws = pkgs.writeShellScriptBin "setup-audio-ws" ''
      pgrep pavucontrol || ${pkgs.pavucontrol}/bin/pavucontrol
      pgrep .easyeffects-wr || ${pkgs.easyeffects}/bin/easyeffects
    '';
in
let tv = pkgs.writeShellScriptBin "tv" ''
  out="${config.monitors.external}"
  primary="${config.monitors.primary}"

  if [ -z "$1" ]; then
      echo "usage: use \"tv [on|off|toggle]\""
      exit 1
  fi
  subcmd="$1"

  if [ subcmd = "toggle" ]; then
    hyprctl monitors | grep $out && subcmd="on" || subcmd="off"
  fi

  if [ $subcmd = "on" ]; then
    echo "enabling output $out"
    hyprctl keyword 'monitor '"$out"', 3840x2160@60.00Hz, 5120x0, 1'
    hyprctl keyword workspace 🎮, desc:games, monitor:$out
  fi

  if [ $subcmd = "off" ]; then
    echo "disabling output $out"
    hyprctl keyword 'monitor '"$out"', disable'
    hyprctl keyword workspace 🎮, desc:games, monitor:$primary
  fi
'';
in
{
  imports = [
    ./waybar.nix
    ./fuzzel.nix
  ];

  options = {
    monitors = {
      primary = lib.mkOption {
        type = lib.types.str;
        default = "DP-1";
      };
      secondary = lib.mkOption {
        type = lib.types.str;
        default = "DP-2";
      };
      external = lib.mkOption {
        type = lib.types.str;
        default = "HDMI-A-1";
      };
    };
    hyprland.enable = lib.mkEnableOption "enable custom hyprland config";
    hyprland.disableHardwareCursor = lib.mkEnableOption  "disable the hardware cursor";

    hyprland.modKey = lib.mkOption {
      default = "SUPER";
      type = lib.types.str;
    };

    hyprland.autostart.onStart = lib.mkOption {
      type = with lib.types; listOf str;
      description = "list of commands to run when hyprland first initializes";
      default = [];

    };
    hyprland.autostart.onReload = lib.mkOption {
      type = with lib.types; listOf str;
      description = "list of commands to every time hyprland reloads";
      default = [
        "${set-bg}/bin/set-bg ${config.home.wallpaper}"
        "${setup-audio-ws}/bin/setup-audio-ws"
      ];
    };
  };

  config = lib.mkIf config.hyprland.enable {
    home.packages = with pkgs; [
      tv
    ];
    wayland.windowManager.hyprland.systemd.variables = ["--all"];
    wayland.windowManager.hyprland.enable = true;
    wayland.windowManager.hyprland.settings = {

      "$mod" = config.hyprland.modKey;
      "$ws_steam" = "Steam";
      "$ws_games" = "🎮";
      "$m_left" = "DP-1";
      "$m_right" = "DP-2";
      "$terminal" = "${pkgs.kitty}/bin/kitty";

      exec = config.hyprland.autostart.onReload;
      exec-once = config.hyprland.autostart.onStart;
      env =
      [
        "QT_AUTO_SCREEN_SCALE_FACTOR,1"
        "QT_QPA_PLATFORM,wayland;xcb"
        "QT_WAYLAND_DISABLE_WINDOWDECORATION,1"
        "QT_QPA_PLATFORMTHEME,qt5ct"
        "GDK_BACKEND,wayland,x11"
        "_JAVA_AWT_WM_NONREPARENTING,1"
        "SDL_VIDEO_DRIVER,x11"
      ]
      ++ (if config.hyprland.disableHardwareCursor then [ "WLR_NO_HARDWARE_CURSORS,1" ] else []);

      input = {
        kb_layout = "us";
        kb_variant = "altgr-intl";
        kb_model = "pc104";
        float_switch_override_focus = 0;
        natural_scroll = 0;
        special_fallthrough = true;
        mouse_refocus = false; # fixes steam menus disappearing
        sensitivity = 0; # -1.0 - 1.0, 0 means no modification.
        touchpad = {
          natural_scroll = false;
        };
      };

      general = {
        layout = "master";
        gaps_in = "3, 3, 3, 3";
        gaps_out = "5,0,0,0"; # top, right, bottom, left
        border_size = 2;
        "col.active_border" = "rgba(${color.text-highlight}FF)";
        "col.inactive_border" = "rgba(${color.text}FF) rgba(${color.background-accent}FF) 45deg";
        # Please see https://wiki.hyprland.org/Configuring/Tearing/ before you turn this on
        allow_tearing = false;
        resize_on_border = true;
        extend_border_grab_area = 20;
      };

      misc = {
        disable_hyprland_logo = true;
        disable_splash_rendering = true;
        initial_workspace_tracking = 2;
        force_default_wallpaper = 0; # Set to 0 or 1 to disable the anime mascot wallpapers
      };

      decoration = {
        # See https://wiki.hyprland.org/Configuring/Variables/ for more
        rounding = 10; # was 10
        blur = {
            enabled = true;
            size = 3;
            passes = 1;
            vibrancy = 0.1696;
            special = false;
          };
        drop_shadow = true;
        shadow_range = 4;
        shadow_render_power = 3;
        "col.shadow" = "rgba(1a1a1aee)";
      };

      render = {
        #TODO: reevaluate, currently causes flicker in fullscreen
        direct_scanout = false;
      };

      animations = {
        enabled = true;
        bezier = "myBezier, 0.05, 0.9, 0.1, 1.05";
        animation =
        [
          "windows, 1, 5, myBezier"
          "windowsOut, 1, 7, default, popin 80%"
          "border, 1, 10, default"
          "borderangle, 1, 8, default"
          "fade, 1, 7, default"
          "workspaces, 0"
        ];
      };

      dwindle = {
        # See https://wiki.hyprland.org/Configuring/Dwindle-Layout/ for more
        pseudotile = true; # master switch for pseudotiling. Enabling is bound to mainMod + P in the keybinds section below
        preserve_split = true; # you probably want this
      };

      gestures = {
        # See https://wiki.hyprland.org/Configuring/Variables/ for more
        workspace_swipe = false;
      };

      workspace =
      [
        "1, monitor:$m_left, default: true"
        "3, monitor:$m_left"
        "5, monitor:$m_left"
        "7, monitor:$m_left"
        "9, monitor:$m_left"
        "2, monitor:$m_right, default: true"
        "4, monitor:$m_right"
        "6, monitor:$m_right"
        "8, monitor:$m_right"
        "10, monitor:$m_right"
        "name:$ws_games,desc:games, monitor:$m_right"
        "special:teamspeak, on-created-empty:TeamSpeak"
        "special:audio, on-created-empty:${setup-audio-ws}/bin/setup-audio-ws"
      ]
      ++ (if config.programs.steam.enable then ["special:$ws_steam, on-created-empty:steam" ] else [])
      ++ (if config.programs.torrent.enable then ["special:qbittorrent, on-created-empty:${pkgs.qbittorrent}/bin/qbittorrent" ] else [])
      ++ (if config.programs.discord.enable then ["special:discord, on-created-empty:${pkgs.discord}/bin/discord" ] else [])
      ++ (if config.programs.whatsappweb.enable then ["special:whatsapp, on-created-empty:whatsapp" ] else []);


      # KEY BINDINGS
      bind =
      [
        # Example binds, se https://wiki.hyprland.org/Configuring/Binds/ for more
        "$mod, return, exec, $terminal"
        "$mod, Q, killactive"
        "$mod SHIFT, M, exit"

        "$mod, E, exec, ${pkgs.xfce.thunar}/bin/thunar"
        "$mod SHIFT, E, exec, ${pkgs.xfce.thunar}/bin/thunar --name thunar-floating"

        "$mod, V, togglefloating"
        "$mod, space, exec, ${pkgs.fuzzel}/bin/fuzzel"
        "$mod, C, exec, $BROWSER"
        #"$mod, P, pseudo, # dwindle
        #"$mod, J, togglesplit, # dwindle
        "$mod, F, fullscreen, 0"
        "$mod SHIFT, F, fullscreen, 1"

        # Global Keybinds
        "$mod, M, pass, (.*)"

        # Move focus with mainMod + arrow keys
        "$mod, left, movefocus, l"
        "$mod, right, movefocus, r"
        "$mod, up, movefocus, u"
        "$mod, down, movefocus, d"

        # Switch workspaces with mainMod + [0-9]
        "$mod, 1, workspace, 1"
        "$mod, 2, workspace, 2"
        "$mod, 3, workspace, 3"
        "$mod, 4, workspace, 4"
        "$mod, 5, workspace, 5"
        "$mod, 6, workspace, 6"
        "$mod, 7, workspace, 7"
        "$mod, 8, workspace, 8"
        "$mod, 9, workspace, 9"
        "$mod, 0, workspace, 10"
        "$mod, G, workspace, name:$ws_games"
        # Move active window to a workspace with mainMod + SHIFT + [0-9]
        "$mod SHIFT, 1, movetoworkspace, 1"
        "$mod SHIFT, 2, movetoworkspace, 2"
        "$mod SHIFT, 3, movetoworkspace, 3"
        "$mod SHIFT, 4, movetoworkspace, 4"
        "$mod SHIFT, 5, movetoworkspace, 5"
        "$mod SHIFT, 6, movetoworkspace, 6"
        "$mod SHIFT, 7, movetoworkspace, 7"
        "$mod SHIFT, 8, movetoworkspace, 8"
        "$mod SHIFT, 9, movetoworkspace, 9"
        "$mod SHIFT, 0, movetoworkspace, 10"
        "$mod SHIFT, G, movetoworkspace, name:$ws_games"

        # Scroll through existing workspaces with mainMod + scroll
        "$mod, mouse_down, workspace, e+1"
        "$mod, mouse_up, workspace, e-1"

        "$mod, T, togglespecialworkspace, teamspeak"
        "$mod CTRL, T, movetoworkspacesilent, special:teamspeak"

        # SCREENSHOTS
        ''$mod SHIFT, S, exec, ${pkgs.grim}/bin/grim -o "$(hyprctl monitors -j | jq -r '.[] | select(.focused)| .name')" - | ${pkgs.satty}/bin/satty --filename - --fullscreen --initial-tool crop''

        # AUDIO WORKSPACE
        "$mod, A, togglespecialworkspace, audio"
        "$mod CTRL, A, movetoworkspacesilent, special:audio"
      ]
      ++ (if config.programs.steam.enable then [
        "$mod, S, togglespecialworkspace, $ws_steam"
        "$mod CTRL, S, movetoworkspacesilent, special:$ws_steam"
      ] else [])
      ++ (if config.programs.torrent.enable then [
        "$mod, B, togglespecialworkspace, qbittorrent"
        "$mod CTRL, B, movetoworkspacesilent, special:qbittorrent"
      ] else [])
      ++ (if config.programs.whatsappweb.enable then [
        "$mod, W, togglespecialworkspace, whatsapp"
        "$mod CTRL, W, movetoworkspacesilent, special:whatsapp"
      ] else [])
      ++ (if config.programs.discord.enable then [
        "$mod SHIFT, T, togglespecialworkspace, discord"
        "$mod CTRL SHIFT, T, movetoworkspacesilent, special:discord"
      ] else []);


      binde =
      [
        # Example volume button that allows press and hold, volume limited to 150%
        ", XF86AudioRaiseVolume, exec, wpctl set-volume -l 1.5 @DEFAULT_AUDIO_SINK@ 5%+"
        ", XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
        ", XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
      ];

      bindm =
      [
        # Move/resize windows with mainMod + LMB/RMB and dragging
        "$mod, mouse:272, movewindow"
        "$mod, mouse:273, resizew"
      ];

      "$steam_game_class" = "steam_app_.*";
      windowrulev2 =
      [
        # file picker
        "float, class:(org.freedesktop.impl.portal.desktop.kde)"
        "float, initialClass:(xdg-desktop-portal-gtk)"

        #"nomaximizerequest, class:.* # You'll probably like this."
        "float, initialTitle:(Paradox Launcher)"

        # chromium popup windows
        "float, initialClass:(^chrome.*Default$)"

        # godot
        "tile, initialTitle:(^Godot$)"
        "size 800 900, initialClass:(^Godot$), initialTitle:(^Create New Node$)"
        "center, initialClass:(^Godot$), initialTitle:(^Create New Node$)"
        "size 600 800, initialClass:(^Godot$), initialTitle:(^Instantiate Child Scene$)"
        "center, initialClass:(^Godot$), initialTitle:(^Instantiate Child Scene$)"
        "size 600 800, initialClass:(^Godot$), initialTitle:(^Resource$)"
        "center, initialClass:(^Godot$), initialTitle:(^Resource$)"
        "size 1300 1000, initialClass:(^Godot$), initialTitle:(^Project Settings.*$)"
        "center, initialClass:(^Godot$), initialTitle:(^Project Settings.*$)"
        "size 400 600, initialClass:(^Godot$), initialTitle:(^Pick a node to animate:$)"
        "center, initialClass:(^Godot$), initialTitle:(^Pick a node to animate:*$)"
        # peazip
        "float, initialClass:(peazip)"
        "float, initialClass:(peazip)"

        # AUDIO
        #"float, class:(pavucontrol)"
        #"size 1400 1000, class:(pavucontrol)"
        #"center, class:(pavucontrol)"
        "workspace special:audio silent, initialClass:(pavucontrol)"
        "workspace special:audio silent, initialClass:(com.github.wwmm.easyeffects)"

        "opacity 0.0 override 0.0 override,class:^(xwaylandvideobridge)$"
        "noanim,class:^(xwaylandvideobridge)$"
        "noinitialfocus,class:^(xwaylandvideobridge)$"
        "maxsize 1 1,class:^(xwaylandvideobridge)$"
        "noblur,class:^(xwaylandvideobridge)$"

        # whatsapp
        "workspace special:whatsapp silent, title:(web.whatsapp.com.*)"
        "float, title:(web.whatsapp.com.*)"
        "size 1400 1000, title:(web.whatsapp.com.*)"
        "center, title:(web.whatsapp.com.*)"

        "workspace special:teamspeak silent, class:(TeamSpeak), title:(TeamSpeak)"
        "float, class:(TeamSpeak), title:(TeamSpeak)"
        "size 1400 1000, class:(TeamSpeak), title:(TeamSpeak)"
        "center, class:(TeamSpeak), title:(TeamSpeak)"

        #THUNAR
        "size 1400 1000, initialClass:(^thunar-floating$)"
        "float, initialClass:(^thunar-floating$)"

        # gamescope
        "workspace name:$ws_games, class:(^gamescope$)"
        "workspace name:$ws_games, class:(^gamescope$)"

        # blueman
        "float, initialClass:(^.blueman-manager-wrapped$)"

        #leagueoflegends #TODO: remove
        "workspace name:$ws_games, class:(leagueclient[ux]*.exe)"
        "monitor $m_right, class:(leagueclient[ux]*.exe)"
        "noanim, class:(leagueclient[ux]*.exe)"

        # SCREENSHOTS / SATTY
        "fullscreen, class:(^com.gabm.satty$)"
        "noanim, class:(^com.gabm.satty$)"
      ]
      ++ (if config.programs.discord.enable then [
        # discord
        "workspace special:discord silent, initialClass:(discord)"
        "float, initialClass:(discord)"
        "size 1400 1000, initialClass:(discord)"
        "center, initialClass:(discord)"
      ] else [])
      ++ (if config.programs.steam.enable then [
        # STEAM CLIENT
        "workspace special:Steam silent, initialClass:(^steam$), initialTitle:(^Steam$)"
        "noinitialfocus, initialClass:(^steam$), initialTitle:(^Steam$)"
        "workspace special:Steam silent, initialClass:(^steam$), initialTitle:(^Sign in to Steam$)"
        "noinitialfocus, initialClass:(^steam$), initialTitle:(^Sign in to Steam$)"
        # STEAM GAMES
        "noinitialfocus, class:($steam_game_class)"
        "tile, class:($steam_game_class)"
        "workspace name:$ws_games, initialClass:($steam_game_class)"
        "monitor $m_right, initialClass:($steam_game_class)"
      ] else [])
      ++ (if config.programs.torrent.enable then [
        "workspace special:qbittorrent silent, initialTitle:(^qBittorrent v.*$)"
        "float, initialClass:(^org.qbittorrent.qBittorrent$)"
        "size 1400 1000, initialClass:(^org.qbittorrent.qBittorrent$)"
        "tile, initialTitle:(^qBittorrent v.*$)"
        "workspace special:qbittorrent silent, initialClass:(^org.qbittorrent.qBittorrent$), initialTitle:(^Preferences$)"

      ] else [])
      ++ (if config.games.nintendo.switch.enable then [
        "workspace name:$ws_games silent, initialClass:(^Ryujinx$)"
        "monitor $m_right, initialClass:(^Ryujinx$)"
      ] else []);
    };
  };
}