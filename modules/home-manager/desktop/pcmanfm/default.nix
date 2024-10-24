{ config, pkgs, lib, ... }:
{
  options = {


  };


  config = {
    ".local/share/file-manager/actions/edit.desktop".text = bultins.readFile "./actions/edit.desktop";

    
  
  };

  
}