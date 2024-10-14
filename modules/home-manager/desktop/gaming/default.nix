{ config, pkgs, lib, ... }:
let switch-flash = pkgs.writeShellScriptBin "switch-flash" ''
  $XDG_DATA_HOME/fusee-launcher/fusee-launcher.py $XDG_CONFIG_HOME/fusee-launcher/payload/fusee-primary.bin
  '';
in
{
    imports = [
    ./savegames.nix
    ./emulation.nix
    ];

  options = {
    games.minecraft.enable = lib.mkEnableOption "enables minecraft";
  };

  config = {

    home.packages = with pkgs;
    (if config.games.minecraft.enable then [ prismlauncher ] else []);
  };

}