{ lib, fetchzip, fetchurl, pkgs }:
fetchzip {
  name = "die-in-a-fire";
  #hash = "sha256-H54xoaW1rHUdX90CjGbTd3GhewmSWEILmh5YDcb5SC4=";
  url = "http://nix.yank.as/fonts/die_in_a_fire_pg.zip.zip";

  nativeBuildInputs = [ pkgs.unzip ];
  #stripRoot = false;
  downloadToTemp = true;
  stripRoot = false;
  postFetch = ''
    mkdir -p $out/share/fonts/opentype
    unzip -j /build/fighting_spirit_tbs.zip \*.otf -d $out/share/fonts/opentype
  '';

  meta = with lib; {
    homepage = "https://comicfontsby.tehandeh.com/";
    description = "Fighting Spirit comic font";
    license = lib.licenses.unfree;
    platforms = platforms.all;
  };
}