{ lib, fetchzip, fetchurl, pkgs }:
fetchzip {
  name = "die-in-a-fire";
  hash = "sha256-tcNyIXPXq68/+Hv8HsKx5z64xnY6zn8pbO6YQ3biUUI=";
  url = "http://nix.yank.as/fonts/die_in_a_fire_pg.zip";

  nativeBuildInputs = [ pkgs.unzip ];
  #stripRoot = false;
  downloadToTemp = true;
  stripRoot = false;
  postFetch = ''
    mkdir -p $out/share/fonts/opentype
    unzip -j /build/die_in_a_fire_pg.zip \*.otf -d $out/share/fonts/opentype
  '';

  meta = with lib; {
    homepage = "https://comicfontsby.tehandeh.com/";
    description = "Die in a Fire comic font ";
    license = lib.licenses.unfree;
    platforms = platforms.all;
  };
}