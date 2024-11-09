{ stdenv, which, lib, fetchzip, fetchurl, pkgs }:
let
  d2r-tools-exe = fetchzip {
    name = "d2r-tools";
    hash = "sha256-AQ72m5Jd9y5qt4cdw52jCUSqvhtQ/iSP6u32ssJMROU=";
    url = "http://nix.yank.as/d2r-tools.tar.gz";

    nativeBuildInputs = [];
    #stripRoot = false;
    downloadToTemp = false;
    stripRoot = false;
    postFetch = ''
      chmod -R 755 $out/*
    '';

    meta = with lib; {
      homepage = "https://comicfontsby.tehandeh.com/";
      description = "Tools for modding Diablo II Ressurected, including CascViewer and D2EXcel";
      #license = lib.licenses.unfree;
      platforms = platforms.all;
    };
  };

  d2r-tools = stdenv.mkDerivation {
      name = "d2r-tools";
        buildInputs = [
          d2r-tools-exe
          which
        ];

        unpackPhase = "true";

        installPhase = ''
          mkdir -p $out/bin
          echo "HELP"
          echo $(which CascViewer.exe)
          printf "#!/bin/sh\nwine ${d2r-tools-exe}/CascViewer.exe" >> $out/bin/cascviewer
          printf "#!/bin/sh\nwine ${d2r-tools-exe}/D2ExcelPlus.exe" >> $out/bin/d2excel

          chmod 0755 $out/bin/*

        '';
  };
  in
d2r-tools