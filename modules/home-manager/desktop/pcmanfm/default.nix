{ config, pkgs, lib, builtin, ... }:
{
  options = {


  };


  config = {
    ".local/share/file-manager/actions/edit.desktop".text = builtins.readFile "./actions/edit.desktop";

    
  
  };

  
}