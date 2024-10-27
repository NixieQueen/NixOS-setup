{ config, pkgs, ... }:

{
    environment.systemPackages = with pkgs; [
        openconnect
        luaPackages.luarocks
        zip
        unzip
        alsa-utils
        pavucontrol
        eog
        emacs
        firefox
        wget
        neofetch
        kitty
        polkit_gnome
        polkit
        playerctl
        xdg-desktop-portal-gtk
        appimage-run
        python3
    ];
}
