{ lib, fetchzip, fetchurl, pkgs }:
fetchzip {
  name = "d2r-tools";
  #hash = "sha256-tcNyIXPXq68/+Hv8HsKx5z64xnY6zn8pbO6YQ3biUUI=";
  url = "http://nix.yank.as/${name}.tar.gz";

  nativeBuildInputs = [];
  #stripRoot = false;
  downloadToTemp = true;
  stripRoot = false;
  postFetch = ''
    mkdir -p $out/share/d2rtools
    tar -xzvf -j /build/${name}.tar.gz  -d $out/share/d2rtools
  '';

  meta = with lib; {
    homepage = "https://comicfontsby.tehandeh.com/";
    description = "Tools for modding Diablo II Ressurected, including CascViewer and D2EXcel";
    license = lib.licenses.unfree;
    platforms = platforms.all;
  };
}