{ lib, fetchzip, fetchurl, pkgs }:

fetchzip {
  name = "fighting-spirit";
  hash = "sha256-H54xoaW1rHUdX90CjGbTd3GhewmSWEILmh5YDcb5SC4=";
  url = "http://nix.yank.as/fonts/fighting_spirit_tbs.zip";

  nativeBuildInputs = [ pkgs.unzip ];
  #stripRoot = false;
  downloadToTemp = true;
  stripRoot = false;
  postFetch = ''
    mkdir -p $out/share/fonts/opentype
    unzip -j /build/fighting_spirit_tbs.zip \*.otf -d $out/share/fonts/opentype
  '';

  meta = with lib; {
    homepage = "";
    description = "";
    license = lib.licenses.unfree;
    platforms = platforms.all;
  };
}