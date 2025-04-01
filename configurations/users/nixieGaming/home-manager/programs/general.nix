{ config, inputs, pkgs, ... }:

{
    home.packages = with pkgs; [
        neofetch
        hyfetch
        btop
        #pymol
        #qchem.gromacs

        clipse

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
