{ pkgs, ... }:

{
    nixpkgs.overlays = [
    (final: prev: {
      iqmol = pkgs.stdenv.mkDerivation rec {
        pname = "iqmol";
        version = "master";

        boost = pkgs.boost.override { enableShared = false; enabledStatic = true; };
        nativeBuildInputs = with pkgs; [
          pkg-config
          cmake
          gfortran
          libsForQt5.qt5.full
          libsForQt5.libqglviewer
          zlib
          libGL
          libGLU
          libarchive
          glfw
          fftw
          libpng
          blas
          lapack
          openssl
          openbabel
          openmesh
          boost
        ];

        buildInputs = with pkgs; [

        ];

        preConfigure = ''
        '';

        src = pkgs.fetchFromGitHub {
          owner = "nutjunkie";
          repo = "IQmol3";
          rev = "${version}";
          sha256 = "sha256-pC9D6PXbOd83Yi1Xz1TCdffYKd5L7OQWcCn9SggNhZQ=";
        };

        #installPhase = ''
        #'';
      };
    })
  ];
}
