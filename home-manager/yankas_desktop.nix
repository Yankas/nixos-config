{ inputs,
  outputs,
  lib,
  config,
  pkgs,
  nix-colors,
  ... }:
{
    imports = [ 
      outputs.homeManagerModules.common
      outputs.homeManagerModules.desktop
      inputs.nix-colors.homeManagerModules.default
    ];

  home = {
    username = "yankas";
    homeDirectory = "/home/yankas";
    isSudoer = true;
    enableNixpkgsReleaseCheck = false;
    stateVersion = "24.05";
    file = {};
    sessionVariables = {
      BROWSER = "chromium";
    };
    wallpaper = "hgss.png";
  };

  monitors = {
    primary = "DP-2";
    secondary = "DP-1";
    external = "HDMI-A-1";
  };

  programs = {
    torrent.enable = true;
    whatsappweb.enable = true;
    discord.enable = true;
    steam.enable = true;
  };

  games = {
    saves.enable = true;
    minecraft.enable = true;
    thesims4-updater.enable = true;
    ps3.enable = true;
    psp.enable = true;
    nintendo = {
      switch.enable = true;
      gba.enable = true;
      ds.enable = true;
      #_3ds.enable = true;
    };
  };




  hyprland.enable = true;
  hyprland.autostart.onStart = [
      #"/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1"
      #"waybar"
      "steam"
      "${pkgs.discord}/bin/discord"
      "xrandr --output DP-2 --primary" 
  ];

  wayland.windowManager.hyprland.settings = {    
    monitor = [
      "$m_left, 2560x1440@144, 0x0, 1, vrr, 2"
      "$m_right, 2560x1440@144, 2560x0, 1, vrr, 2"
      #"HDMI-A-1, 3840x2160@60.00Hz, 5120x0, 1"
    ];
  };
  
  gtk = {
    #font = { 
    #  name = "Die in a fire PG";
    #  size = 12;
    #};
  };

  gtk.gtk3.bookmarks = [
      "file:///home/${config.home.username}/source Source"
      "file:///doc/ Documents"
      "file:///pic/ Pictures"
      "file:///iso/ Iso"
      "file:///mus/ Music"
  ];

  programs.git = {
    userEmail = "christopher.sbrisny@gmail.com";
    userName = "yankas";
  };

}
