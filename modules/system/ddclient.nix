{ 
  lib,
  config,
  pkgs,
  ... 
} :
{
  services.ddclient = {
    enable = true;
    protocol = "cloudflare";
    zone = "yank.as";
    username = "token";
    passwordFile = "/etc/nixos/modules/system/ddclient.pass";
    ssl = true;
    #ttl = 1;
    use="web, web=he";
    interval = "5min";
    domains = [ "yank.as" ];
    extraConfig = "ttl=1";
  };
}