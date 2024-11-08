{ lib, fetchzip, fetchurl, pkgs }:
fetchzip {
  name = "d2r-tools";
  hash = "sha256-ofi5lJfJGL4/R/gYD0SQxczU3PCFFE5L9Nec1E4KXuE=";
  url = "http://nix.yank.as/d2r-tools.tar.gz";

  nativeBuildInputs = [];
  #stripRoot = false;
  downloadToTemp = true;
  stripRoot = true;
  postFetch = ''
    mkdir -p $out/share/d2rtools
    mv build/*.exe $out/share/d2rtools/
    #tar -xzvf /build/d2r-tools.tar.gz  -C $out/share/d2rtools
  '';

  meta = with lib; {
    homepage = "https://comicfontsby.tehandeh.com/";
    description = "Tools for modding Diablo II Ressurected, including CascViewer and D2EXcel";
    #license = lib.licenses.unfree;
    platforms = platforms.all;
  };
}