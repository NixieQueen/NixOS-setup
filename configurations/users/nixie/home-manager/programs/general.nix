{ inputs, pkgs, ... }:

{
  home.packages = with pkgs; [
    inputs.zotero-nix.packages.${system}.default
    discord
    #neofetch
    hyfetch
    btop
    thunderbird-bin
    krita
    #teams-for-linux  # This is calling in an electron package that is built *manually*, avoid at all costs
    libreoffice-fresh

    osu-lazer-bin

    vlc
    evince  # Pdf reader

    #pymol
    #qchem.gromacs

    #clipse

    # OBS
    # (pkgs.wrapOBS {
    #   plugins = with pkgs.obs-studio-plugins; [
    #     wlrobs
    #     obs-backgroundremoval
    #     obs-pipewire-audio-capture
    #   ];
    # })

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
    #(wineWowPackages.stable.override { waylandSupport = true; })
    wineWowPackages.stable
    #wine-wayland

  ];
}
