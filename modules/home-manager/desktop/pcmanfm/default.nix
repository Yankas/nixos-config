{ config, pkgs, lib, builtin, ... }:
{
  options = {


  };


  config.home.file = {
    ".local/share/file-manager/actions/edit.desktop".text =  ''
        [Desktop Entry]
        Type=Action
        Profiles=profile_id
        Name=EDIT
        Icon=Icon name
        # Example: Icon=text-editor
        
        [X-Action-Profile profile_id]
        MimeTypes=all/allfiles
        Exec=exec gedit %f
        # Example: Exec=gedit %f
    '';  

    ".local/share/pcmanfm/actions/edit.desktop".text = 
    ''
      [Desktop Entry]
      Type=Action
      Profiles=profile_id
      Name=Action name in English
      Name[cc]=Action name in Language
      Icon=Icon name
      # Example: Icon=text-editor
      
      [X-Action-Profile profile_id]
      MimeTypes=MIME-types (semicolon separated)
      Exec=command and arguments
      # Example: Exec=gedit %f
    '';  
  };

  
}