{ config, pkgs, inputs, outputs, ... }:
{
  imports = [ 
    outputs.homeManagerModules.common
    outputs.homeManagerModules.desktop
    inputs.nix-colors.homeManagerModules.default
  ];

  home = {
    username = "guest";
    homeDirectory = "/home/guest";
    enableNixpkgsReleaseCheck = false;
    stateVersion = "24.05";
    #packages = [];
    #file = {};
    sessionVariables = {
      BROWSER = "chromium";
    };
  };
  options = {
    desktop.enable = lib.mkEnableOption "enables torrent client";
    programs.torrent.enable = lib.mkEnableOption "enables torrent client";
    programs.gimp.enable = lib.mkEnableOption "enables gimp";
    programs.blender.enable = lib.mkEnableOption "enables blender";
  };


  programs = {
    home-manager.enable = true;   # Let Home Manager install and manage itself.
  };

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = [
    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  #home.file = { };

}
