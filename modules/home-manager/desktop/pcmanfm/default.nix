{ config, pkgs, lib, builtin, ... }:
{
  options = {


  };


  config = {
    ".local/share/file-manager/actions/edit.desktop".text = builtin.readFile "./actions/edit.desktop";

    
  
  };

  
}