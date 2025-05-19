{ config, pkgs, ... }:

{
    home.packages = with pkgs; [
        dconf
        python314
        ripgrep
        dex
        usbutils
        socat
        pyright
    ];
}
