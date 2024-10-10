{ 
  lib,
  config,
  pkgs,
  ... 
}: 

{
  options = {
    programs.godot.enable = lib.mkEnableOption "enables godot 4 engine";
    programs.tiled.enable = lib.mkEnableOption "enables tiled map editor";
  };

  config = {
    
    environment.systemPackages = with pkgs;
    (if config.programs.godot.enable then [ godot4-mono dotnet-sdk_8] else [])
    ++ (if config.programs.tiled.enable then [ tiled ] else []);
  };


}