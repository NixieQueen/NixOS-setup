{ config, inputs, pkgs, ... }:

{
    home.packages = with pkgs; [
        discord
        neofetch
        hyfetch
        btop
        #picom-ft-labs
        thunderbird-bin
        krita
        teams-for-linux
        libreoffice-fresh

        #pymol
        #qchem.gromacs

        clipse

        blender

        # OBS
        (pkgs.wrapOBS {
          plugins = with pkgs.obs-studio-plugins; [
            wlrobs
            obs-backgroundremoval
            obs-pipewire-audio-capture
          ];
        })

        inputs.ignis.packages.${system}.ignis

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
