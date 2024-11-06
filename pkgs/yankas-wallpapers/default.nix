{ lib, fetchzip, fetchurl, pkgs }:

fetchzip {
  name = "yankas-wallpapers";
  hash = "sha256-1zT8c2vbU3ZyJ250YSk2iQFiEgx6q+D//Op3Pgl+geU="; #"sha256-H54xoaW1rHUdX90CjGbTd3GhewmSWEILmh5YDcb5SC4=";
  url = "http://nix.yank.as/wallpapers.zip";

  nativeBuildInputs = [ pkgs.unzip ];
  #stripRoot = false;
  downloadToTemp = true;
  stripRoot = false;
  postFetch = ''
    mkdir -p $out/share/wallpapers
    unzip -o /build/wallpapers.zip -d $out/share/wallpapers
  '';

  meta = with lib; {
    homepage = "";
    description = "";
    platforms = platforms.all;
  };
}