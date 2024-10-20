{ config, pkgs, lib, nix-colors, ... }:
{
  imports = [
    ./gaming/default.nix
    ./hyprland/default.nix
    ./misc.nix
  ];

  colorScheme = {
    slug = "rocket";
    name = "Rocket";
    author = "Gabriel Fontes (https://github.com/Misterio77)";
    palette = {
      base00 = "#271C3A";
      base01 = "#100323";
      base02 = "#3E2D5C";
      base03 = "#5D5766";
      base04 = "#BEBCBF";
      base05 = "#DEDCDF";
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
    associations.added = {
    };

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
      name = "Matcha-dark-sea";
    };
    iconTheme = {
      package = pkgs.qogir-icon-theme;
      name = "Qogir-manjaro-dark";
    };

    gtk3.bookmarks = [
      "file:///home/yankas/download Downloads"
    ];
  };

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
      font_size = 20;
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
  };
}