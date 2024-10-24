{ config, pkgs, lib, builtin, ... }:
{
  options = {


  };


  config = {
    ".local/share/file-manager/actions/edit.desktop".text = builtins.readFile "/etc/nixos/modules/home-manager/desktop/pcmanfm/actions/edit.desktop";

    
  
  };

  
}