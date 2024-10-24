{ config, pkgs, lib, ... }:
{
  options = {


  };


  config = {
    ".local/share/pcmanfm/actions/action".text = bultins.readFile "Edit.desktop"

    
    

  };

  
}