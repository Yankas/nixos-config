{ inputs,
  outputs,
  lib,
  config,
  pkgs,
  nix-colors,
  style,
  ... }:
{
    imports = [
      outputs.homeManagerModules.common
      outputs.homeManagerModules.desktop
      inputs.nix-colors.homeManagerModules.default
    ];

  laptopMode.enable = true;
  home = {
    username = "yankas";
    isSudoer = true;
    enableNixpkgsReleaseCheck = false;
    stateVersion = "24.05";
    file = {};
    sessionVariables = {
      BROWSER = "chromium";
    };
    packages = with pkgs; [
      whipper
      strawberry
      body-utils
      d2r-tools
      bottles
      solaar
    ];
    wallpaper = "hgss.png";
  };

  monitors = {
    primary = "LVDS-1";
    external = "HDMI-A-1";
  };

  programs = {
    #torrent.enable = true;
    whatsappweb.enable = true;
    discord.enable = true;
    steam.enable = true;
  };

  games = {
    #saves.enable = true;
    #minecraft.enable = true;
    #thesims4-updater.enable = true;
    #ps3.enable = true;
    #psp.enable = true;
    nintendo = {
      #switch.enable = true;
      gba.enable = true;
      ds.enable = true;
      #_3ds.enable = true;
    };
  };




  hyprland.enable = true;
  hyprland.disableHardwareCursor = false;
  hyprland.autostart.onStart = [
      #"/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1"
      #"waybar"
      "steam"
      "${pkgs.discord}/bin/discord"
  ];

  wayland.windowManager.hyprland.settings = {
    monitor = [
      "$m_left, 1280x800@60, 0x0, 1"
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
      "file:///mus/ Music"
      "file:///vid/ Video"
      "file:///home/yankas/download Downloads"
      "file:///iso/ Iso"
  ];

  programs.git = {
    userEmail = "christopher.sbrisny@gmail.com";
    userName = "yankas";
  };

}
