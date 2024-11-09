{ stdenv, lib, fetchzip, fetchurl, pkgs, makeDesktopItem }:
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
      description = "Tools for modding Diablo II Ressurected, including CascViewer and D2EXcel";
      #license = lib.licenses.unfree;
      platforms = platforms.all;
    };
  };

  desktop = makeDesktopItem {
    name = "cascviewer";
    desktopName = "CascViewer";
    comment = "Tool to view Casc Files for various Blizzard games";
    genericName = "Archive Viewer";
    categories = [ "Game" ];
    exec = "cascviewer";
  };


  d2r-tools = stdenv.mkDerivation {
      name = "d2r-tools";
        buildInputs = [
          d2r-tools-exe
        ];

        unpackPhase = "true";

        installPhase = ''
          mkdir -p $out/bin
          mkdir -p $out/share/applications
          printf "#!/bin/sh\nwine ${d2r-tools-exe}/CascViewer.exe" >> $out/bin/cascviewer
          printf "#!/bin/sh\nwine ${d2r-tools-exe}/D2ExcelPlus.exe" >> $out/bin/d2excel
          printf "#!/bin/sh\nwine ${d2r-tools-exe}/d2rlint.exe" >> $out/bin/d2rlint
          chmod 0755 $out/bin/*

          ln -s ${desktop}/share/applications/* $out/share/applications
        '';
      description = "Tools for modding Diablo II Ressurected, including CascViewer and D2EXcel";
      #license = lib.licenses.unfree;
      #platforms = platforms.all;
  }; in
d2r-tools