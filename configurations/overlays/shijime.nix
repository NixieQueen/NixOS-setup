{ pkgs, ... }:

{
    nixpkgs.overlays = [
    (final: prev: {
      shijime = pkgs.stdenv.mkDerivation rec {
        pname = "shijime";
        version = "v0.2.0-alpha1";
        dontBuild = true;

        nativeBuildInputs = with pkgs.xorg; [
          
        ];

        src = pkgs.fetchFromGitHub {
          owner = "pixelomer";
          repo = "Shijima-Qt";
          #rev = "${version}";
          #sha256 = "sha256-";
          sha256 = "";
        };

        installPhase = ''
          
        '';
      };
    })
  ];
}
