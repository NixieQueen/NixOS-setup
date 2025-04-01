{ config, pkgs, ... }:

{
    programs = {
        steam = {
            enable = true;
            remotePlay.openFirewall = true;
            localNetworkGameTransfers.openFirewall = true;
            gamescopeSession.enable = true;
        };
    };
}
