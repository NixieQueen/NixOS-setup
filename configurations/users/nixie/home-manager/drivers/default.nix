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

    xdg.systemDirs.data = [
        "$HOME/.local/share"
    ];

    xdg.userDirs = {
        enable = true;
        createDirectories = true;
    };
}
