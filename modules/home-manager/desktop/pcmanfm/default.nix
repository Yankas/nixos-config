{ config, pkgs, lib, builtin, ... }:
{
  options = {


  };


  config.home.file = {
    ".local/share/file-manager/actions/edit.desktop".text =  ''
        [Desktop Entry]
        Type=Action
        Tooltip=TestActions
        Profiles=profile_id
        Name=Editor
        Icon=text-editor
        # Example: Icon=text-editor
        
        [X-Action-Profile profile_id]
        MimeTypes=all/allfiles
        Exec=exec gedit %f
        # Example: Exec=gedit %f
    ''; 

  };

  
}