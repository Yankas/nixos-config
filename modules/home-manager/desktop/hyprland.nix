{ config, pkgs, lib, ... }:
let
    set-bg = pkgs.writeShellScriptBin "set-bg" ''
      ${pkgs.swaybg}/bin/swaybg -i /run/current-system/sw/share/wallpapers/$1
    '';
in
{

  wayland.windowManager.hyprland.systemd.variables = ["--all"];
  wayland.windowManager.hyprland.enable = true;
  

  wayland.windowManager.hyprland.settings = {    
    "$mod" = "SUPER";
    "$ws_steam" = "Steam";
    "$ws_games" = "🎮";
    "$m_left"="DP-1";
    "$m_right"="DP-2";
    "$terminal" = "kitty";
    "$fileManager" = "thunar";
    "$menu" = "fuzzel";

    env =
    [
      "QT_AUTO_SCREEN_SCALE_FACTOR,1"
      "QT_QPA_PLATFORM,wayland;xcb"
      "QT_WAYLAND_DISABLE_WINDOWDECORATION,1"
      "QT_QPA_PLATFORMTHEME,qt5ct"
      "GDK_BACKEND,wayland,x11"
      "_JAVA_AWT_WM_NONREPARENTING,1"
      "WLR_NO_HARDWARE_CURSORS,1"
    ];

    input = {
      kb_layout = "us";
      kb_variant = "altgr-intl";
      kb_model = "pc104";
      float_switch_override_focus = 0;
      natural_scroll = 0;
      special_fallthrough = true;
      mouse_refocus=false; # fixes steam menus disappearing
      sensitivity = 0; # -1.0 - 1.0, 0 means no modification.
      touchpad = {
        natural_scroll = false;
      };
    };
    general = {
      layout = "master";
      gaps_in = 5;
      gaps_out = 5;
      border_size = 2;
      "col.active_border" = "rgba(33ccffee) rgba(00ff99ee) 45deg";
      "col.inactive_border" = "rgba(595959aa)";
      # Please see https://wiki.hyprland.org/Configuring/Tearing/ before you turn this on
      allow_tearing = false;
      resize_on_border = true;
    };

    master = {
      no_gaps_when_only = 1;
      smart_resizing = false;
    };

    misc = {
      vrr = 1;
      disable_hyprland_logo = true;
      disable_splash_rendering = true;
      force_default_wallpaper = -1; # Set to 0 or 1 to disable the anime mascot wallpapers
    };
    
    decoration = {
      # See https://wiki.hyprland.org/Configuring/Variables/ for more
      rounding = 10;
      blur = {
          enabled = true;
          size = 3;
          passes = 1;
          vibrancy = 0.1696;
        };
      drop_shadow = true;
      shadow_range = 4;
      shadow_render_power = 3;
      "col.shadow" = "rgba(1a1a1aee)";
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

    exec = [
      #"swaybg -i /run/current-system/sw/share/wallpapers/${config.home.wallpaper}"
      "${set-bg}/bin/set-bg ${config.home.wallpaper}"
    ];

    exec-once = [
      #"/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1"
      #"waybar"
      "steam"
      "discord"
    ];

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
      "special:qbittorrent, on-created-empty:qbittorrent"
      "special:$ws_steam, on-created-empty:steam"
      "special:teamspeak, on-created-empty:TeamSpeak"
      "special:whatsapp, on-created-empty:whatsapp"
      "special:discord, on-created-empty:discord"
    ];

    # KEY BINDINGS
    bind =
    [
      # Example binds, se https://wiki.hyprland.org/Configuring/Binds/ for more
      "$mod, return, exec, $terminal"
      "$mod, Q, killactive"
      "$mod SHIFT, M, exit"
      "$mod, E, exec, $fileManager"
      "$mod, V, togglefloating"
      "$mod, space, exec, $menu"
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

      "$mod SHIFT, T, togglespecialworkspace, discord"
      "$mod CTRL SHIFT, T, movetoworkspacesilent, special:discord"
        
      "$mod, B, togglespecialworkspace, qbittorrent"
      "$mod CTRL, B, movetoworkspacesilent, special:qbittorrent"

      "$mod, S, togglespecialworkspace, $ws_steam"
      "$mod CTRL, S, movetoworkspacesilent, special:$ws_steam"

      "$mod, T, togglespecialworkspace, teamspeak"
      "$mod CTRL, T, movetoworkspacesilent, special:teamspeak"

      "$mod, W, togglespecialworkspace, whatsapp"
      "$mod CTRL, W, movetoworkspacesilent, special:whatsapp"
    ];

    binde =
    [
      # Example volume button that allows press and hold, volume limited to 150%
      ", XF86AudioRaiseVolume, exec, wpctl set-volume -l 1.5 @DEFAULT_AUDIO_SINK@ 5%+"
    ];
    
    bindl = [
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
      
      #pavucontrol
      "float, class:(pavucontrol)"
      "size 1400 1000, class:(pavucontrol)"
      "center, class:(pavucontrol)"

      "opacity 0.0 override 0.0 override,class:^(xwaylandvideobridge)$"
      "noanim,class:^(xwaylandvideobridge)$"
      "noinitialfocus,class:^(xwaylandvideobridge)$"
      "maxsize 1 1,class:^(xwaylandvideobridge)$"
      "noblur,class:^(xwaylandvideobridge)$"

      # whatsapp
      "workspace special:whatsapp, title:(web.whatsapp.com.*)"
      "float, title:(web.whatsapp.com.*)"
      "size 1400 1000, title:(web.whatsapp.com.*)"
      "center, title:(web.whatsapp.com.*)"

      "workspace special:teamspeak, class:(TeamSpeak), title:(TeamSpeak)"
      "float, class:(TeamSpeak), title:(TeamSpeak)"
      "size 1400 1000, class:(TeamSpeak), title:(TeamSpeak)"
      "center, class:(TeamSpeak), title:(TeamSpeak)"
      
      # steam
      "workspace special:Steam, initialClass:(^steam$), initialTitle:(^Steam$)"
      "noinitialfocus, initialClass:(^steam$), initialTitle:(^Steam$)"
      "workspace special:Steam, initialClass:(^steam$), initialTitle:(^Sign in to Steam$)"
      "noinitialfocus, initialClass:(^steam$), initialTitle:(^Sign in to Steam$)"

      # steam games
      "noinitialfocus, class:($steam_game_class)"
      #"windowdance, class:($steam_game_class)"
      "monitor $m_right, initialClass:($steam_game_class)"
      "workspace name:$ws_games, initialClass:($steam_game_class)"

      # gamescope
      "workspace name:$ws_games, class:(^gamescope$)"
      "workspace name:$ws_games, class:(^gamescope$)"

      #leagueoflegends #TODO: remove
      "workspace name:$ws_games, class:(leagueclient[ux]*.exe)"
      "monitor $m_right, class:(leagueclient[ux]*.exe)"
      "noanim, class:(leagueclient[ux]*.exe)"

      # discord
      "workspace special:discord, initialClass:(discord)"
      "noinitialfocus, initialClass:(discord)"
      "float, initialClass:(discord)"
      "size 1400 1000, initialClass:(discord)"
      "center, initialClass:(discord)"
    ];


  };
}