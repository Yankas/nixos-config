{ stdenv, which, lib, fetchzip, fetchurl, pkgs }:
let
  d2r-tools-exe = fetchzip {
    name = "d2r-tools";
    hash = "sha256-zki5VWAT6NxlZvonMvYmsUmzR4toIBzh6S6mOGXCzbY=";
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
          printf "#!/bin/sh\nwine ${d2r-tools-exe}/CascViewer.exe" >> $out/bin/cascviewer
          printf "#!/bin/sh\nwine ${d2r-tools-exe}/D2ExcelPlus.exe" >> $out/bin/d2excel
          printf "#!/bin/sh\nwine ${d2r-tools-exe}/d2rlint_v1.3.1.exe" >> $out/bin/d2rlint
          chmod 0755 $out/bin/*
        '';
  };
  in
d2r-tools