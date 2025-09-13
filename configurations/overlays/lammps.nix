{ pkgs, ... }:

{
<<<<<<< HEAD
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

=======
  nixpkgs.overlays = [
    (final: prev: {
      lammps = pkgs.stdenv.mkDerivation rec {
        pname = "lammps";
        version = "1.8.2";
        dontBuild = true;

        nativeBuildInputs = with pkgs; [
        ];

>>>>>>> f4fc22d (Setup: lammps-gui)
        src = pkgs.fetchFromGitHub {
          owner = "akohlmey";
          repo = "lammps-gui";
          rev = "${version}";
<<<<<<< HEAD
          sha256 = "sha256-xH8eRZ6n3DvQPOKbzYls/PufDQkrU/uixuOcsuvj01I=";
        };

        #installPhase = ''
        #'';
=======
          #sha256 = "sha256-";
          sha256 = "";
        };

        installPhase = ''
          tar -xvf LAMMPS-GUI-Linux-*.tar.gz
          cd ./LAMMPS-GUI

          mkdir -p $out/qtplugins

          cp -r ./bin $out/bin
          cp -r ./lib $out/lib
          cp -r ./share $out/share
          cp -r ./qtplugins $out/qtplugins
        '';
>>>>>>> f4fc22d (Setup: lammps-gui)
      };
    })
  ];
}
