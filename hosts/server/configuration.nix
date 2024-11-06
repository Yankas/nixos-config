{ 
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ... 
}: {
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      inputs.home-manager.nixosModules.home-manager
      outputs.systemModules.common
    ];

  networking = {
    hostName = "msrv";
    interfaces.enp6s0.ipv4.addresses = [ { 
      address = "192.168.1.2";
      prefixLength = 24;
    } ];
    hosts = {
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

  home-manager = {
      extraSpecialArgs = { inherit inputs outputs; };
      users = {
        # Import your home-manager configuration
        yankas = import ../../home-manager/home.nix;
      };
    };

  environment.systemPackages = with pkgs; [];

  # Configure keymap in X11
  # services.xserver.xkb.layout = "us";
  # services.xserver.xkb.options = "eurosign:e,caps:escape";
  system.stateVersion = "24.05"; # DO NOT CHANGE
}

