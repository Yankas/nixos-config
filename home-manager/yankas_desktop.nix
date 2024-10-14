{ inputs,
  outputs,
  lib,
  config,
  pkgs,
  ... }:
{
    imports = [ 
      outputs.homeManagerModules.common
      outputs.homeManagerModules.desktop
    ];

  home = {
    username = "yankas";
    homeDirectory = "/home/yankas";
    isSudoer = true;
    enableNixpkgsReleaseCheck = false;
    stateVersion = "24.05";
    packages = [];
    file = {};
    sessionVariables = {
      BROWSER = "chromium";
      TEST = "TEST";
    };
    wallpaper = "hgss.png";
  };

  games = {
    saves.enable = true;
    minecraft.enable = true;
    thesims4-updater.enable = true;
    nintendo = {
      switch.enable = true;
      gba.enable = true;
      ds.enable = true;
    };
  };

  autostart.exec-once = [
      #"/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1"
      #"waybar"
      "steam"
      "discord"
  ];

  wayland.windowManager.hyprland.settings = {    
    monitor = [
      "$m_left, 2560x1440@144, 0x0, 1, vrr, 2"
      "$m_right, 2560x1440@144, 2560x0, 1, vrr, 2"
      #"HDMI-A-1, 3840x2160@60.00Hz, 5120x0, 1"
    ];
  };
  

  gtk.gtk3.bookmarks = [
      "file:///home/${config.home.username}/source Source"
      "file:///doc/ Documents"
      "file:///pic/ Pictures"
      "file:///iso/ Iso"
      "file:///mus/ Music"
  ];
  programs.steam.enable = true;

  programs.git = {
    userEmail = "christopher.sbrisny@gmail.com";
    userName = "yankas";
  };

}
