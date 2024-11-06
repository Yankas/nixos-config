{ pkgs ? import <nixpkgs> {} }:

pkgs.stdenv.mkDerivation {
  name = "body-utils";
  propagatedBuildInputs = [
    (pkgs.python3.withPackages (pythonPackages: with pythonPackages; [

    ]))
  ];
  dontUnpack = true;
  installPhase = ''
    install -Dm755 ${./weight.py} $out/bin/weight
  '';
}