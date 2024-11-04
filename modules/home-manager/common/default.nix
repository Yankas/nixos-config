{ config, lib, pkgs, outputs, inputs, ... }:
let update = pkgs.writeShellScriptBin "update" ''
  #!/bin/sh
  cd /etc/nixos
  git add .
  git commit -m.
  sudo nixos-rebuild switch --flake /etc/nixos#default
  '';
in
let mvln = pkgs.writeShellScriptBin "mvln" ''
  while [ $# -gt 1 ]; do
    eval "target=\''${$#}"
    original="$1"
    if [ -d "$target" ]; then
      target="$target/''${original##*/}"
    fi
    mv -- "$original" "$target"
    case "$original" in
      */*)
        case "$target" in
          /*) :;;
          *) target="$(cd -- "$(dirname -- "$target")" && pwd)/''${target##*/}"
        esac
    esac
    ln -s -- "$target" "$original"
    shift
  done
'';
in

{
  imports = [
      ./lf.nix
    ];
  options = {
    home.aliases = lib.mkOption {
       type = with lib.types; attrsOf str;
       description = "list of shell aliases";
    };
    home.isSudoer = lib.mkEnableOption "is this user a sudoer";
    programs.steam.enable = lib.mkEnableOption "additional steam configuration";
    programs.minecraft.enable = lib.mkEnableOption "additional steam configuration";
  };

  config = {
    systemd.user.startServices = "sd-switch"; # Nicely reload system units when changing configs
    nixpkgs = {
      # You can add overlays here
      overlays = [
        # Add overlays your own flake exports (from overlays and pkgs dir):
        outputs.overlays.additions
        outputs.overlays.modifications
        outputs.overlays.unstable-packages
      ];
      # Configure your nixpkgs instance
      config = {
        allowUnfree = true;
      };
    };

    programs = {
      home-manager.enable = true;
      git.enable = true;

      zsh = {
      enable = true;
      enableCompletion = true;
      autosuggestion.enable = true;
      poweroff = "sudo poweroff";
      shutdown = "sudo shutdown";
    };
        shellAbbrs = config.home.aliases;
        interactiveShellInit = ''
          set fish_greeting # Disable greeting
        '';
      };
    };

    programs.git = {
      extraConfig = {
        init.defaultBranch = "main";
        safe.directory = "/etc/nixos";
      };
    };

    home.aliases = {
      ll = "ls -l";
      cp = "cp -iv";
      mv = "mv -iv";
      rm = "rm -Iv";
      mkd = "mkdir -pv";
      ex = "atool -x";
      grep = "grep --color=auto";
      diff = "diff --color=auto";
      now = "'date +\"%T\"'";
      ipe = "curl ipinfo.io/ip";
    } // lib.optionalAttrs config.programs.git.enable {
      g = "git";
      gco = "git checkout";
      gc = "git commit";
      clone = "git clone";
    } // lib.optionalAttrs config.home.isSudoer {
      mount = "sudo mount";
      umount = "sudo umount";
      reboot = "sudo reboot";
      poweroff = "sudo poweroff";
      shutdown = "sudo shutdown";
    };

    home.packages = [
      mvln
      ]
      ++(if config.home.isSudoer then [ update ] else []);


    home.sessionVariables = {
      EDITOR = "nvim";
      VISUAL = "nvim";
      XDG_DOCUMENTS_DIR="/doc";
      XDG_DOWNLOAD_DIR= "\$HOME/download";
    } // lib.optionalAttrs config.programs.steam.enable {
      STEAM_EXTRA_COMBAT_TOOLS_PATHS = lib.mkIf config.programs.steam.enable "\${HOME}/.steam/root/compatibilitytools.d";
    } // lib.optionalAttrs config.programs.minecraft.enable {
      MINECRAFT_HOME = lib.mkIf config.games.minecraft.enable "\${HOME}/.local/share/PrismLauncher/instances";
    };

  };

}