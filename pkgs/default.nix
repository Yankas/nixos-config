# Custom packages, that can be defined similarly to ones from nixpkgs
# You can build them using 'nix build .#example'
pkgs: {
  # example = pkgs.callPackage ./example { };

  d2r-tools = pkgs.callPackage ./d2r-tools/default.nix { };
  godot4-mono = pkgs.callPackage ./godot4-mono/default.nix { };
  body-utils = pkgs.callPackage ./body-utils/default.nix { };
  fighting-spirit = pkgs.callPackage ./fonts/fighting-spirit.nix { };
  die-in-a-fire = pkgs.callPackage ./fonts/die-in-a-fire.nix { };
  yankas-wallpapers = pkgs.callPackage ./yankas-wallpapers/default.nix {};
  fusee-launcher = pkgs.callPackage ./fusee-launcher/default.nix { };
}