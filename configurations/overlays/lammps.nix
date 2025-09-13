{ pkgs, ... }:

{
    nixpkgs.overlays = [
    (final: prev: {
      lammps = pkgs.stdenv.mkDerivation rec {
        pname = "lammps-gui";
        version = "v1.8.2";

        nativeBuildInputs = with pkgs; [
          cmake
          libsForQt5.qt5.wrapQtAppsHook
          python3
          python313Packages.sphinx
          python313Packages.sphinxcontrib-spelling
          python313Packages.sphinxcontrib-jquery
          python313Packages.sphinx-design
          #python313Packages.
        ];

        buildInputs = with pkgs; [
          libsForQt5.qt5.qtcharts
        ];

        preConfigure = ''
        '';

        src = pkgs.fetchFromGitHub {
          owner = "akohlmey";
          repo = "lammps-gui";
          rev = "${version}";
          sha256 = "sha256-xH8eRZ6n3DvQPOKbzYls/PufDQkrU/uixuOcsuvj01I=";
        };

        #installPhase = ''
        #'';
      };
    })
  ];
}
