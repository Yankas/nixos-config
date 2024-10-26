with import <nixpkgs> {};

mkShell {
  name = "dotnet-env";
  buildInputs = with pkgs; [
    fontconfig
    xorg.libX11
    xorg.libX11.dev
    zlib
  ];
  LD_LIBRARY_PATH = lib.makeLibraryPath [
    # required by avalonia
    fontconfig
    xorg.libX11
    xorg.libX11.dev
    xorg.libICE
    xorg.libSM
    zlib
  ];
  packages = [
    (with dotnetCorePackages; combinePackages [
      sdk_6_0
      sdk_7_0
      sdk_8_0
    ])
  ];
}