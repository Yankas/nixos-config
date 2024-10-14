{ config, pkgs, lib, ... }:
let switch-flash = pkgs.writeShellScriptBin "switch-flash" ''
  $XDG_DATA_HOME/fusee-launcher/fusee-launcher.py $XDG_CONFIG_HOME/fusee-launcher/payload/fusee-primary.bin
  '';
in
{
  options = {
    programs.minecraft.enable = lib.mkEnableOption "enables minecraft";
  };

  config = {
    import = [
    ./savegames.nix
    ./emulation.nix
    ];


    environment.systemPackages = with pkgs;
    (if config.programs.nintendo.ds.enable then [ prismlauncher ] else [])
  };

}