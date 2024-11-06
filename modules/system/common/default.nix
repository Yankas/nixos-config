{ config, lib, pkgs, outputs, inputs, ... }:
{
  imports = [
    ./msrv-integration.nix
  ];

  config = {
    nixpkgs = {
      overlays = [ outputs.overlays.additions ];
      config.allowUnfree = true;
    };

    nix = let
      flakeInputs = lib.filterAttrs (_: lib.isType "flake") inputs;
    in {
      settings = {
        # Enable flakes and new 'nix' command
        experimental-features = "nix-command flakes";
        # Opinionated: disable global registry
        flake-registry = "";
        # Workaround for https://github.com/NixOS/nix/issues/9574
        nix-path = config.nix.nixPath;
      };
      # Opinionated: make flake registry and nix path match flake inputs
      registry = lib.mapAttrs (_: flake: {inherit flake;}) flakeInputs;
      nixPath = lib.mapAttrsToList (n: _: "${n}=flake:${n}") flakeInputs;
    };


    users.groups.nixcfg.gid = 1500;

    systemd.tmpfiles.settings = {
      "10-nixcfg-permissions" = {
        "/etc/nixos" = {
          Z = {
            mode = "0770";
            user = "root";
            group = "nixcfg";
          };
          z = {
            mode = "0775";
            user = "root";
            group = "nixcfg";
          }
        };
        "/etc/nixos/**/" = {
          z = {
            mode = "0775";
            user = "root";
            group = "nixcfg";
          };
        };
      };
    };

    networking.networkmanager.enable = true;

    time.timeZone = "Europe/Berlin";

    programs.zsh.enable = true;
    programs.fish.enable = true;

    environment.systemPackages = with pkgs; [
      neovim
      git
      lf
      eza # ls replacement
      jq
      tre # improved tree
      rename
      #nodePackages.insect
      # ARCHIVE
      atool
      unzip
      p7zip
      unrar
      usbutils
    ];

    programs = {
      gnupg.agent = {
        enable = true;
        enableSSHSupport = true;
      };
      git = {
        enable = true;
        package = pkgs.gitFull;
      };
    };


    programs.git = {

    };

    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;
    programs.mtr.enable = true; # diagnostic tool combines ping + traceroute

    networking.defaultGateway = lib.mkDefault  "192.168.1.1";
    networking.nameservers = lib.mkDefault  [ "8.8.8.8" ];
    # Select internationalisation properties.
    # i18n.defaultLocale = "en_US.UTF-8";
    # console = {
    #   font = "Lat2-Terminus16";
    #   keyMap = "us";
    #   useXkbConfig = true; # use xkb.options in tty.
    # };
  };

}