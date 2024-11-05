{ config, pkgs, ... }:

{
    environment.systemPackages = with pkgs; [
        openconnect
        luaPackages.luarocks
        lua-pam
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
        xdg-desktop-portal-hyprland
        appimage-run
        python3
    ];
}
