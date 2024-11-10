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
  };

  d2r-tools = stdenv.mkDerivation rec {
    name = "d2r-tools";

    nativeBuildInputs = [
      # copyDesktopItems is run in postInstall hook make sure to call
      # it from installPhase with "runHook postInstall"
      copyDesktopItems
    ];
    buildInputs = [
      d2r-tools-exe

    ];
    desktopItems = [
      (makeDesktopItem {
        name = "cascviewer";
        desktopName = "CascViewer";
        comment = "Tool to view Casc Files for various Blizzard games";
        genericName = "Archive Viewer";
        categories = [ "Development" ];
        exec = "cascviewer";
      })
      (makeDesktopItem {
        name = "afjsheetedit";
        desktopName = "AFJ Sheet Editor";
        comment = "Tool to edit Diablo II spreadsheets";
        genericName = "Spreadsheet Editor";
        categories = [ "Development" ];
        exec = "afjsheet";
      })
  ];

  unpackPhase = "true";

  installPhase = ''
    mkdir -p $out/bin
    printf "#!/bin/sh\nwine ${d2r-tools-exe}/CascViewer.exe" >> $out/bin/cascviewer
    printf "#!/bin/sh\nwine ${d2r-tools-exe}/afjsheet.exe" >> $out/bin/afjsheet
    printf "#!/bin/sh\nwine ${d2r-tools-exe}/d2rlint.exe" >> $out/bin/d2rlint
    chmod 0755 $out/bin/*

    runHook postInstall
  '';

  description = "Tools for modding Diablo II Ressurected, including CascViewer and AFJ SHeeteditor and d2rlint";
  #license = lib.licenses.unfree;
  #platforms = platforms.all;
  }; in
d2r-tools