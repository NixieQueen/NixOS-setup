{ pkgs, ... }:

{
#     nixpkgs.overlays = [
#     (final: prev: {
#       lammps = pkgs.stdenv.mkDerivation rec {
#         pname = "lammps-gui";
#         version = "v1.8.2";

#         nativeBuildInputs = with pkgs; [
#           cmake
#           libsForQt5.qt5.wrapQtAppsHook
#           python3
#           python313Packages.sphinx
#           python313Packages.sphinxcontrib-spelling
#           python313Packages.sphinxcontrib-jquery
#           python313Packages.sphinx-design
#           #python313Packages.
#         ];

#         buildInputs = with pkgs; [
#           libsForQt5.qt5.qtcharts
#         ];

#         preConfigure = ''
#         '';

#         src = pkgs.fetchFromGitHub {
#           owner = "akohlmey";
#           repo = "lammps-gui";
#           rev = "${version}";
#           sha256 = "sha256-xH8eRZ6n3DvQPOKbzYls/PufDQkrU/uixuOcsuvj01I=";
#         };

#         #installPhase = ''
#         #'';
#       };
#     })
#   ];

  nixpkgs.overlays = [
    (final: prev: {
      lammps-gui = pkgs.stdenv.mkDerivation rec {
        pname = "lammps-gui";
        version = "v1.8.3";

        src = pkgs.fetchzip {
          url = "https://github.com/akohlmey/lammps-gui/releases/download/${version}/LAMMPS-GUI-Linux-x86_64-${version}.tar.gz";
          sha256 = "sha256-9UyQ2NL7JG95lR994rXVcsBzHD628ilq7Cs3HwIiWUw=";
        };

        buildInputs = with pkgs; [

        ];

        #autoPatchelfIgnoreMissingDeps = [ "*" ];

        autoPatchelfHook = true;

        installPhase = ''
          mkdir -p $out/lib
          mkdir -p $out/bin
          mkdir -p $out/share
          mkdir -p $out/qtplugins
          mv ./lib/* $out/lib
          mv ./bin/* $out/bin
          mv ./share/* $out/share
          mv ./qtplugins/* $out/qtplugins
        '';
     };
    })
  ];

}
