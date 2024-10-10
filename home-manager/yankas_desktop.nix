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

  gtk.gtk3.bookmarks = [
      "file:///home/yankas/source Source"
      "file:///doc/ Documents"
      "file:///pic/ Pictures"
      "file:///iso/ Iso"
      "file:///mus/ Music"
  ];

  programs = {
    steam.enable = true;
    minecraft.enable = true;
    nintendo = {
      switch.enable = true;
      gba.enable = true;
      ds.enable = true;
    };
  };

  programs.git = {
    userEmail = "christopher.sbrisny@gmail.com";
    userName = "yankas";
  };
}
