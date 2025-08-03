{ pkgs, modulesPath, ... }:

let install = pkgs.writeShellScriptBin "install" ''
  #rm -rf $HOME/.config/gtk-3.0/bookmarks
  cd /etc/nixos
  git add .
  git commit -m.
  sudo nixos-rebuild switch --flake /etc/nixos#default
  '';
in
{

  imports = [
    "${modulesPath}/installer/cd-dvd/installation-cd-minimal.nix"
    outputs.systemModules.common
  ];

  environment.systemPackages = with pkgs; {
    disko
  };

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

}