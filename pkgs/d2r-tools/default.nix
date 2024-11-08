{ lib, fetchzip, fetchurl, pkgs }:
fetchzip {
  name = "d2r-tools";
  hash = "sha256-kpk8uyPj+dguoHWZKNPdzmGG8AM1RZtbht9KA/E3Umw=";
  url = "http://nix.yank.as/d2r-tools.tar.gz";

  nativeBuildInputs = [];
  #stripRoot = false;
  downloadToTemp = true;
  stripRoot = false;
  postFetch = ''

    echo "LBBUBERFWEFWE"
    ls -als $out
    pwd
    echo "Ddqwedfqwd"
    mkdir -p $out/share/d2rtools
    #tar -xzvf d2r-tools.tar.gz  -C $out/share/d2rtools
    mv $out/*.exe $out/share/d2rtools/*
  '';

  meta = with lib; {
    homepage = "https://comicfontsby.tehandeh.com/";
    description = "Tools for modding Diablo II Ressurected, including CascViewer and D2EXcel";
    #license = lib.licenses.unfree;
    platforms = platforms.all;
  };
}