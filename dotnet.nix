with import <nixpkgs> {};

mkShell {
  name = "dotnet-env";
  buildInputs = with pkgs; [
    fontconfig
    xorg.libX11
    xorg.libX11.dev
    zlib
    libICE
  ];
  LD_LIBRARY_PATH = lib.makeLibraryPath [
    fontconfig
    xorg.libX11
    xorg.libX11.dev
    libICE
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