{
    common = import ./common/default.nix;
    desktop = import ./desktop/default.nix;
    server = import ./server/default.nix;
    ddclient = import ./ddclient.nix;
}