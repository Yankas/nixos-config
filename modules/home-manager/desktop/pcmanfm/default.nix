{ config, pkgs, lib, ... }:
{
  options = {


  };


  config = {
    ".local/share/file-manager/actions/action".text = bultins.readFile "Edit.desktop"

    
    

  };

  
}