{ stdenv, pkgs, ... }:

{
    nixpkgs.overlays = [
    (final: prev: {
      sddm-sugar-theme = stdenv.mkDerivation rec {
        pname = "sddm-sugar-candy-theme";
        version = "1.6";
        dontBuild = true;

        installPhase = ''
          mkdir -p $out/share/sddm/themes/sugar-candy
          cp ${pkgs.writeText "$out/share/sddm/themes/sugar-candy/theme.conf" ''
[General]

Background="${
        (pkgs.fetchFromGitHub {
          owner = "NixieQueen";
          repo = "awesomeWM-setup";
          rev = "177425c9904f5cf7b714a8eb8d03f8b943d44ada";
          sha256 = "8U3J9N/fYviIdZYKmoNsHppo3blc7eEBtZFJ3zRZxWM=";
        })}/themes/nixie-theme/backgrounds/MountainDragon.png"
          ''} $out/share/sddm/themes/sugar-candy/theme.conf
          cp -Rn $src/* $out/share/sddm/themes/sugar-candy/
        '';

        src = pkgs.fetchFromGitHub {
          owner = "Kangie";
          repo = "sddm-sugar-candy";
          rev = "v1.6";
          sha256 = "sha256-p2d7I0UBP63baW/q9MexYJQcqSmZ0L5rkwK3n66gmqM=";
        };
      };
    })
  ];
}
