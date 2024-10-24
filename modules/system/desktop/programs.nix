{ 
  lib,
  config,
  pkgs,
  ... 
}: 
{
  options = {
    programs.rider.enable = lib.mkEnableOption "enables dotnet development enviornment";
    programs.sddm-dev.enable = lib.mkEnableOption "enables tools for sddm theme creation";  
    programs.godot.enable = lib.mkEnableOption "enables godot 4 engine";
    programs.tiled.enable = lib.mkEnableOption "enables tiled map editor";
    programs.virtualization.enable = lib.mkEnableOption "enables tiled map editor";
  };


  config = {
    environment.systemPackages = with pkgs;
      (if config.programs.godot.enable then [ godot4-mono dotnet-sdk_8] else [])
      ++ (if config.programs.tiled.enable then [ tiled ] else [])
      ++ (if config.programs.rider.enable then [ 
        jetbrains.rider 
        dotnet-sdk_8 
        dotnet-sdk_7 
        dotnet-sdk_6 
        ] else [])
      ++ (if config.programs.sddm-dev.enable then [
        qt5.full
        qtcreator
        cmake
      ] else []);


      mkShell {
        name = "dotnet-env";
        packages = [
          (with dotnetCorePackages; combinePackages [
            sdk_6_0
            sdk_7_0
            sdk_8_0
          ])
          powershell
        ];
      };

    virtualisation.libvirtd = lib.mkIf config.programs.virtualization.enable  {
      enable = true;
    };
    programs.virt-manager.enable = lib.mkIf config.programs.virtualization.enable true;
  };
}


