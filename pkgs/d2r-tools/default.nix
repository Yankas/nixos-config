{ stdenv, lib, fetchzip, fetchurl, pkgs, makeDesktopItem, copyDesktopItems }:
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




  d2r-tools = stdenv.mkDerivation rec {
      desktopItems = [
        (makeDesktopItem {
          name = "cascviewer";
          desktopName = "CascViewer";
          comment = "Tool to view Casc Files for various Blizzard games";
          genericName = "Archive Viewer";
          categories = [ "Game" ];
          exec = "cascviewer";
        })
        (makeDesktopItem {
          name = "d2excel";
          desktopName = "D2Excel";
          comment = "Tool to edit Diablo II spreadsheets";
          genericName = "Spreadsheet Editor";
          categories = [ "Game" ];
          exec = "cascviewer";
        })
      ];



      name = "d2r-tools";
        nativeBuildInputs = [
          copyDesktopItems
        ];
        buildInputs = [
          d2r-tools-exe

        ];

        unpackPhase = "true";

        installPhase = ''
          mkdir -p $out/bin
          printf "#!/bin/sh\nwine ${d2r-tools-exe}/CascViewer.exe" >> $out/bin/cascviewer
          printf "#!/bin/sh\nwine ${d2r-tools-exe}/D2ExcelPlus.exe" >> $out/bin/d2excel
          printf "#!/bin/sh\nwine ${d2r-tools-exe}/d2rlint.exe" >> $out/bin/d2rlint
          chmod 0755 $out/bin/*

        '';
      description = "Tools for modding Diablo II Ressurected, including CascViewer and D2EXcel";
      #license = lib.licenses.unfree;
      #platforms = platforms.all;
  }; in
d2r-tools