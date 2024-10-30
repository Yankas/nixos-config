{ 
  lib,
  config,
  pkgs,
  ... 
}: 
{
  imports = [
    ./programs.nix
  ];

  options = {
    desktop.enable = lib.mkEnableOption "enables desktop features";
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

    hardware.graphics = {
      enable32Bit = true;
    };

    services = {
      gvfs.enable = true; # USB auto mounting
      xserver.enable = true;
      printing.enable = lib.mkDefault true;
      preload.enable = lib.mkDefault true;
      displayManager = {
        defaultSession = "hyprland";
        sddm = {
          enable = true;
          wayland.enable = true;
        };
      };
      pipewire = {
        enable = true;
        alsa.enable = true;
        alsa.support32Bit = true;
        pulse.enable = true;
      };
    };


    fonts.packages = with pkgs; [
      noto-fonts
      noto-fonts-cjk-sans
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
      die-in-a-fire
    ];

    fonts.fontconfig.defaultFonts = {
      monospace = [ "Fira Code" "Consolas" ];
    };

    programs.hyprland = {
      enable = true;
      xwayland.enable = true;
    }; 

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

    security = {
      pam.loginLimits = [
        {
            domain = "*";
            type = "-";
            item = "memlock";
            value = "unlimited";
        }
      ];
      rtkit.enable = true;
    };




    environment = {
      pathsToLink = [ "/share/wallpapers" ];
      sessionVariables.NIXOS_OZONE_WL = "1";
      etc = {
        "xdg/user-dirs.defaults".text = ''
          DOWNLOAD=download
          DOCUMENTS=/doc
          MUSIC=/mus
          PICTURES=/pic
          VIDEOS=/vid
        '';
      };
      systemPackages = with pkgs; [
        pcmanfm
        peazip

        pragha
        wrapGAppsHook

        chromium
        seahorse
        kitty

        playerctl
        libcec

        nixd
        alejandra
        satty
        grim
        easyeffects
        kanshi # dynamic monitor configuration
      ]
      ++ (if config.programs.blender.enable then [ blender-hip ] else [])
      ++ (if config.programs.gimp.enable then [ gimp ] else [])
      ++ (if config.programs.steam.enable then [ protonup ] else []) # proton ge installer
      ++ (if config.programs.steam.enable then [ mangohud ] else []); 
    };
  };
  

}