{ 
  lib,
  config,
  pkgs,
  ... 
}: 

{
  options = {
    programs.minecraft.enable = lib.mkEnableOption "enables minecraft";
  };

  config = lib.mkIf config.programs.minecraft.enable {
    environment.systemPackages = with pkgs; [
      prismlauncher
    ];
  };
}