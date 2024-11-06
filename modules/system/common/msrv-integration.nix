{
  lib,
  config,
  pkgs,
  ...
}:
{
  options = {
    msrv.host = {
      type = with lib.type; str;
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
      device = "${msrv.host}:/srv/docs";
      fsType = "nfs";
      options = [ "x-systemd.automount" "noauto" ];
    };

    fileSystems."/vid" = {
      device = "${msrv.host}:/srv/video";
      fsType = "nfs";
      options = [ "x-systemd.automount" "noauto" ];
    };

    fileSystems."/iso" = {
      device = "${msrv.host}:/srv/iso";
      fsType = "nfs";
      options = [ "x-systemd.automount" "noauto" ];
    };

    fileSystems."/mus" = {
      device = "${msrv.host}:/srv/music";
      fsType = "nfs";
      options = [ "x-systemd.automount" "noauto" ];
    };

    fileSystems."/pic" = {
      device = "${msrv.host}:/srv/photo";
      fsType = "nfs";
      options = [ "x-systemd.automount" "noauto" ];
    };
  };
}