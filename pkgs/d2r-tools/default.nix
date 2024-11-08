{ lib, fetchzip, fetchurl, pkgs }:
fetchzip {
  name = "d2r-tools";
  hash = "sha256-qn94K26BFfLuZRa4dvf3Sxj3sPtT+Cpl6nbrQqkfXrg=";
  url = "http://nix.yank.as/d2r-tools.tar.gz";

  nativeBuildInputs = [];
  #stripRoot = false;
  downloadToTemp = true;
  stripRoot = false;
  postFetch = ''
    mkdir -p $out/share/d2rtools
    ls
    #mv build/*.exe $out/share/d2rtools/
    #tar -xzvf /build/d2r-tools.tar.gz  -C $out/share/d2rtools
  '';

  meta = with lib; {
    homepage = "https://comicfontsby.tehandeh.com/";
    description = "Tools for modding Diablo II Ressurected, including CascViewer and D2EXcel";
    #license = lib.licenses.unfree;
    platforms = platforms.all;
  };
}