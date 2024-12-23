{ config, pkgs, ... }:

{
    environment.systemPackages = with pkgs; [
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
        appimage-run
        python3
        imagemagickBig
        ffmpeg
    ];
}
