# Custom packages, that can be defined similarly to ones from nixpkgs
# You can build them using 'nix build .#example'
pkgs: {
  # example = pkgs.callPackage ./example { };
  godot4-mono = pkgs.callPackage ./godot4-mono/default.nix { };
  fighting-spirit = pkgs.callPackage ./fonts/fighting-spirit.nix { };
  yankas-wallpapers = pkgs.callPackage ./yankas-wallpapers/default.nix {};
}