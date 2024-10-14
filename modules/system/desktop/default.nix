{ 
  lib,
  config,
  pkgs,
  ... 
}: 
{
    imports =
    [ # Include the results of the hardware scan.
      ./audio.nix
      ./minecraft.nix
      ./gamedev.nix
      ./dotnet-dev.nix
      ./virt-manager.nix
    ];

  options = {
    desktop.enable = lib.mkEnableOption "enables torrent client";
    programs.torrent.enable = lib.mkEnableOption "enables torrent client";
    programs.gimp.enable = lib.mkEnableOption "enables gimp";
    programs.blender.enable = lib.mkEnableOption "enables blender";
  };


  config = lib.mkIf config.desktop.enable {

    programs.steam = lib.mkIf config.programs.steam.enable {
      gamescopeSession.enable = true;
      remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
      dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
      localNetworkGameTransfers.openFirewall = true; # Open ports in the firewall for Steam Local Network Game Transfers
    };
    programs.gamemode.enable = (if config.programs.steam.enable then lib.mkDefault true else lib.mkDefault false);

    xdg.mime.enable = true;
    security.rtkit.enable = true;
    hardware.graphics = {
      enable32Bit = true;
    };

    services.printing.enable = true;

    services.displayManager.sddm = {
      enable = true;
      wayland.enable = true;
      theme="sugar-dark";
    };

    environment.etc = {
    "xdg/user-dirs.defaults".text = ''
      DOWNLOAD=download
      DOCUMENTS=/doc
      MUSIC=/mus
      PICTURES=/pic
      VIDEOS=/vid
    '';
    };

    services.gvfs.enable = true; # USB auto mounting

    services.xserver = {
      enable = true;
    };

    fonts.packages = with pkgs; [
      noto-fonts
      noto-fonts-cjk
      noto-fonts-emoji
      liberation_ttf
      fira-code
      fira-code-symbols
      mplus-outline-fonts.githubRelease
      dina-font
      proggyfonts
      corefonts
      vistafonts
      fighting-spirit
    ];

    programs.hyprland = {
      enable = true;
      xwayland.enable = true;
    }; 

    environment.pathsToLink = [ "/share/wallpapers" ];

    systemd = {
      user.services.polkit-gnome-authentication-agent-1 = {
        description = "polkit-gnome-authentication-agent-1";
        wantedBy = [ "graphical-session.target" ];
        wants = [ "graphical-session.target" ];
        after = [ "graphical-session.target" ];
        serviceConfig = {
            Type = "simple";
            ExecStart = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
            Restart = "on-failure";
            RestartSec = 1;
            TimeoutStopSec = 10;
          };
      };
    };

    security.pam.loginLimits = [
      {
          domain = "*";
          type = "hard";
          item = "memlock";
          value = "65000";
      }
      {
          domain = "*";
          type = "soft";
          item = "memlock";
          value = "65000";
      }
    ];

    environment.sessionVariables.NIXOS_OZONE_WL = "1";

    environment.systemPackages = with pkgs; [
      pcmanfm
      peazip

      chromium
      seahorse
      kitty

      fuzzel
      waybar
      satty
      grim
    ]
    ++ (if config.programs.torrent.enable then [ qbittorrent ] else [])
    ++ (if config.programs.blender.enable then [ blender-hip ] else [])
    ++ (if config.programs.gimp.enable then [ gimp ] else [])
    ++ (if config.programs.steam.enable then [ protonup ] else []) # proton ge installer
    ++ (if config.programs.steam.enable then [ mangohud ] else []); 
  };
  

}