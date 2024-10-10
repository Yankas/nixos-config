{ 
  lib,
  config,
  pkgs,
  ... 
}: 
{
  options = {
    programs.rider.enable = lib.mkEnableOption "enables dotnet development enviornment";
  };

  config = lib.mkIf config.programs.rider.enable {
    environment.systemPackages = with pkgs; [
      jetbrains.rider
      dotnet-sdk_8
      dotnet-sdk_7
      dotnet-sdk_6
    ];
  };
}