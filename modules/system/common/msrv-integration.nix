{
  lib,
  config,
  pkgs,
  ...
}:
{
  options = {
    msrv.host = {
      type = with lib.types; str;
      default = "192.168.1.2";
    };
    msrv.mount.documents = lib.mkEnableOption "mounts msrv:/srv/documents to /doc";
    msrv.mount.video = lib.mkEnableOption "mounts msrv:/srv/video to /vid";
    msrv.mount.iso = lib.mkEnableOption "mounts msrv:/srv/iso to /iso";
    msrv.mount.music = lib.mkEnableOption "mounts msrv:/srv/mus to /mus";
    msrv.mount.pictures = lib.mkEnableOption "mounts msrv:/srv/pic to /pic";
  };

  config = with config; {
    fileSystems."/doc" = {
      device = "${config.msrv.host}:/srv/docs";
      fsType = "nfs";
      options = [ "x-systemd.automount" "noauto" ];
    };

    fileSystems."/vid" = {
      device = "${config.msrv.host}:/srv/video";
      fsType = "nfs";
      options = [ "x-systemd.automount" "noauto" ];
    };

    fileSystems."/iso" = {
      device = "${config.msrv.host}:/srv/iso";
      fsType = "nfs";
      options = [ "x-systemd.automount" "noauto" ];
    };

    fileSystems."/mus" = {
      device = "${config.msrv.host}:/srv/music";
      fsType = "nfs";
      options = [ "x-systemd.automount" "noauto" ];
    };

    fileSystems."/pic" = {
      device = "${config.msrv.host}:/srv/photo";
      fsType = "nfs";
      options = [ "x-systemd.automount" "noauto" ];
    };
  };
}