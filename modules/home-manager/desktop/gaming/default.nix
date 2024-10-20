{ config, pkgs, lib, ... }:
let switch-flash = pkgs.writeShellScriptBin "switch-flash" ''
  $XDG_DATA_HOME/fusee-launcher/fusee-launcher.py $XDG_CONFIG_HOME/fusee-launcher/payload/fusee-primary.bin
  '';
ts4-update = pkgs.writeShellScriptBin "ts4-update" ''
  cd $HOME/.local/share/Steam/steamapps/common/The\ Sims\ 4/
  wine $HOME/.saves/the-sims4/TS4Updater/sims-4-updater-v1.3.4.exe
  '';
ts4-unlock = pkgs.writeShellScriptBin "ts4-unlock" ''
  $HOME/.saves/the-sims4/DLCUnlockerV2/setup_linux.sh
  '';
in
{
    imports = [
    ./savegames.nix
    ./emulation.nix
    ];

  options = {
    games.minecraft.enable = lib.mkEnableOption "enables minecraft";
    games.thesims4-updater.enable = lib.mkEnableOption "enables tools to update the sims 4";
  };

  config = {
    home.packages = with pkgs;
    (if config.games.minecraft.enable then [ prismlauncher ] else [])
    ++ (if config.games.thesims4-updater.enable then [ ts4-update ts4-unlock] else []);
  };


}