# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ 
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ... 
}: {
  imports = [ 
      ./hardware-configuration.nix
      inputs.home-manager.nixosModules.home-manager
      outputs.systemModules.common
      outputs.systemModules.desktop
      outputs.systemModules.ddclient
    ];

  desktop.enable = true;
  networking = {
    hostName = "yankas-desktop";
    interfaces.enp6s0.ipv4.addresses = [ { 
      address = "192.168.1.10";
      prefixLength = 24;
    } ];
    hosts = {
      "192.168.1.2" = [ "iso.yank.as" "nix.yank.as" ];
    };
  };

	users.users.yankas = {
    isNormalUser = true;
    home = "/home/yankas";
    description = "Yankas";
    initialPassword = "123456";
    extraGroups = [ "wheel" "networkmanager" ];
    uid=1000;
    shell = pkgs.fish;
	};

  users.users.guest = {
    isNormalUser = true;
    home = "/home/guest";
    description = "Guest";
    initialPassword = "123456";
    extraGroups = [ "networkmanager" ];
    uid=2000;
    shell = pkgs.fish;
	};
  services.teamviewer.enable = true;
  services.xserver.videoDrivers = [ "amdgpu" ]; 


  home-manager = {
      extraSpecialArgs = { inherit inputs outputs; };
      users = {
        # Import your home-manager configuration
        yankas = import ../../home-manager/yankas_desktop.nix;
        guest = import ../../home-manager/guest_desktop.nix;
      };
    };

  programs = {
    rider.enable = true;
    minecraft.enable = true;
    torrent.enable = true;
    godot.enable = true;
    tiled.enable = true;
    steam.enable = true;
    gimp.enable = true;
    blender.enable = true;
  };



  environment.systemPackages = with pkgs; [
    # BROWSER
    firefox
    tor-browser
    ark
    imagemagick
    rpcs3
    
    # MULTIMEDIA
    jellyfin-media-player
    vlc
    # COMMS
    mumble
    teamspeak5_client
    discord
    vscode
    wineWowPackages.stable
    yankas-wallpapers
  ];

  # Configure keymap in X11
  # services.xserver.xkb.layout = "us";
  # services.xserver.xkb.options = "eurosign:e,caps:escape";
  system.stateVersion = "24.05"; # DO NOT CHANGE
}

