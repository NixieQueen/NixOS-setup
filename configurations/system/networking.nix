{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    openconnect
  ];

  networking = {
    firewall = {
      enable = true;
      allowPing = true;
    };

    openconnect.interfaces = {
      KTH = {
        autoStart = false;
        gateway = "https://vpn.lan.kth.se";
        passwordFile = "/home/nixie/Documents/openconnect";
        protocol = "anyconnect";
        user = "mxvg";
        extraOptions = {
          authgroup = "KTH";
          force-dpd = "5";
        };
      };
    };
  };
  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
}
