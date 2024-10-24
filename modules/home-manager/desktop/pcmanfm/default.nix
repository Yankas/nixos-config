{ config, pkgs, lib, ... }:
{
  options = {


  };


  config = {
    ".local/share/file-manager/actions/edit.desktop".text = bultin.readFile "./actions/edit.desktop";

    
  
  };

  
}