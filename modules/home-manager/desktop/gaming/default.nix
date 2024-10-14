{ config, pkgs, lib, ... }:
let switch-flash = pkgs.writeShellScriptBin "switch-flash" ''
  $XDG_DATA_HOME/fusee-launcher/fusee-launcher.py $XDG_CONFIG_HOME/fusee-launcher/payload/fusee-primary.bin
  '';
in
{
  import = [
    ./savegames.nix
    ./emulation.nix
  ];

  options = {
    programs.minecraft.enable = lib.mkEnableOption "enables minecraft";
  };

  config = lib.mkIf config.programs.minecraft.enable {
    environment.systemPackages = with pkgs; [
      prismlauncher
    ];
  };


}