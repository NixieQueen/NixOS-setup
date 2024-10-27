{ config, pkgs, ... }:

{
    home.packages = with pkgs; [
        discord
        btop
        picom-ft-labs
        thunderbird-bin
        krita
        teams-for-linux
        libreoffice-fresh

        hunspell
        hunspellDicts.uk_UA
        hunspellDicts.nl_nl

        # Setup lutris and its dependancies
        (lutris.override {
        extraLibraries = pkgs: [
            # List lutris dependancies here
        ];
        extraPkgs = pkgs: [
            # Extra lutris pkgs
        ];
        })
        lutris
        winetricks
        wineWowPackages.stable
    ];
}
