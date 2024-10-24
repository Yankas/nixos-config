{ config, pkgs, lib, builtins, ... }:
{
  options = {


  };


  config = {
    ".local/share/file-manager/actions/edit.desktop".text = bultins.readFile "./actions/edit.desktop";

    
  
  };

  
}