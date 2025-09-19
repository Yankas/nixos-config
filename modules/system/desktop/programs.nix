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

        dotnetCorePackages.sdk_9_0
        dotnetCorePackages.sdk_8_0
        dotnetCorePackages.sdk_7_0
        dotnetCorePackages.sdk_6_0
        fontconfig
        ] else [])
      ++ (if config.programs.sddm-dev.enable then [
        qt5.full
        qtcreator
        cmake
      ] else []);

      environment.variables = {
        LD_LIBRARY_PATH = with pkgs; lib.makeLibraryPath ([
          ]
          ++ (if config.programs.rider.enable then [ fontconfig ] else []));
      };

    virtualisation.libvirtd = lib.mkIf config.programs.virtualization.enable  {
      enable = true;
    };
    programs.virt-manager.enable = lib.mkIf config.programs.virtualization.enable true;
  };
}
