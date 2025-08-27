{ config, pkgs, lib, nix-colors, ... }:
let whatsapp = pkgs.writeShellScriptBin "whatsapp"  ''
  #!/bin/sh
  chromium --new-window --app=https://web.whatsapp.com/
'';
in
{
  imports = [
    ./gaming/default.nix
    ./hyprland/hyprland.nix
    ./misc.nix
    ./style.nix
  ];

  options = with lib; {
    assets = lib.mkOption {
      type = with types; str;
      default = "/etc/nixos/assets";
    };

    desktop.nasBookmarks.enable = lib.mkEnableOption "enable GTK bookmarks for the NAS/File Server";
    laptopMode.enable = mkEnableOption "enables various laptop options";
    programs.torrent.enable = mkEnableOption "enables torrent client";
    programs.whatsappweb.enable = mkEnableOption "script to start whatsapp web in an application browser window";
    programs.gimp.enable = mkEnableOption "enables gimp";
    programs.blender.enable = mkEnableOption "enables blender";
    programs.discord.enable = mkEnableOption "enables discord";
  };

  config = {
    assets = "/etc/nixos/assets";
    colorScheme = {
      slug = "rocket";
      name = "Rocket";
      author = "Gabriel Fontes (https://github.com/Misterio77)";
      palette = {
        base00 = "#1A1A1A"; # Default background
        base01 = "#292B2E"; # Lighter Background
        base02 = "#3E2D5C";
        base03 = "#5D5766";
        base04 = "#BEBCBF";
        base05 = "#FDF6E3"; # Default foreground
        base06 = "#EDEAEF";
        base07 = "#BBAADD";
        base08 = "#A92258";
        base09 = "#918889";
        base0A = "#804ead";
        base0B = "#C6914B";
        base0C = "#7263AA";
        base0D = "#8E7DC6";
        base0E = "#953B9D";
        base0F = "#59325C";
      };
    };

    xdg.enable = true;
    xdg.mimeApps = {
      enable = true;
      associations.added = {};

      defaultApplications = {
        "inode/directory" = "pcmanfm.desktop";
        "application/pdf" = "chromium.desktop";
        "application/vnd.rar" = "peazip.desktop";
        "application/x-7z-compressed" = "peazip.desktop";
        "application/zip" = "peazip.desktop";
        "application/x-compressed-tar" = "peazip.desktop";
        "application/x-tar" = "peazip.desktop";
        "application/gzip" = "peazip.desktop";
      };
    };

    qt = {
      enable = true;
      platformTheme.name = "gtk";
      style.name = "breeze";
    };

    gtk = {
      enable = true;
      cursorTheme = {
        package = pkgs.bibata-cursors;
        name = "Bibata-Modern-Ice";
      };
      theme = {
        package = pkgs.matcha-gtk-theme;
        name = "Matcha-dark-aliz";
      };
      iconTheme = {
        package = pkgs.qogir-icon-theme;
        name = "Qogir-ubuntu-dark";
      };

      gtk3.bookmarks = lib.mkIf config.desktop.nasBookmarks.enable [
        "file:///home/${config.home.username}/source Source"
        "file:///doc/ Documents"
        "file:///pic/ Pictures"
        "file:///mus/ Music"
        "file:///vid/ Video"
        "file:///home/yankas/download Downloads"
        "file:///iso/ Iso"
      ];
    };

    home.packages = with pkgs;
      [
        numbat
        icoutils
      ]
      ++(if config.programs.torrent.enable then [ qbittorrent ] else [])
      ++ (if config.programs.whatsappweb.enable then [ whatsapp ] else [])
      ++ (if config.programs.discord.enable then [ discord ] else []);

    home.pointerCursor = {
      gtk.enable = true;
      # x11.enable = true;
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Ice";
      size = 24;
    };

    services = {
      mpris-proxy.enable = true;
    };

    programs.kitty = {
      enable = true;
      settings = {
        include = "./themes/Dracula.conf";
        background_opacity = "0.9";
        dynamic_background_opacity = true;
        allow_remote_control = true;
        scrollback_lines = 3000;
        scrollback_pager_history_size = 8;
        font_size = lib.mkDefault 20;
        adjust_baseline = -3;
        font_family = "Fira Code";
        bold_font = "auto";
        italic_font = "auto";
        bold_italic_font = "auto";
        linux_display_server = "wayland";
        strip_trailing_spaces = "always";
        tab_bar_edge = "top";
        tab_bar_style = "powerline";
        repaint_delay = 7;
        update_check_interval = 0;
        enabled_layouts = "vertical";
        sync_to_monitor = "no";
      };
      keybindings = {
        "ctrl+c" = "copy_and_clear_or_interrupt";
        "ctrl+v" = "ctrl+v paste_from_clipboard";
      };
    };
  };
}