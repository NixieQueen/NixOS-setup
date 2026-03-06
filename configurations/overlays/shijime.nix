{ pkgs, ... }:

{
    nixpkgs.overlays = [
    (final: prev: {
      shijime = pkgs.stdenv.mkDerivation rec {
        pname = "shijime";
        version = "v0.2.0-alpha1";
        dontBuild = false;

        buildInputs = with pkgs; [
          kdePackages.qtbase
        ];
        strictDeps = true;
        #dontUseCmakeConfigure = true;
        
        nativeBuildInputs = with pkgs; [
        #buildInputs = with pkgs; [
          kdePackages.wrapQtAppsHook
          autoPatchelfHook
          kdePackages.qtmultimedia
          pkg-config

          zip
          libarchive.lib
          libgccjit
          gcc

          clang
          cmake          

          xorg.libX11
          libgcc.lib
          glibc
          kdePackages.wayland

          wayland
          wayland-protocols
          libxkbcommon
          libGL
          libGLU
          mesa
        ];
 
        src = pkgs.fetchFromGitHub {
          owner = "pixelomer";
          repo = "Shijima-Qt";
          #rev = "${version}";
          rev = "4efd02e4e5b6e0745cb91cc5d265fb90509e8437"; 
          #sha256 = "sha256-";
          sha256 = "sha256-PxrhVEAsQy+gGREa3t4zHUYpsmH0fwfr3+EJEDlqp8o=";
        };

        buildPhase = ''
          CONFIG=release make -j8
        '';
        
        installPhase = ''
          install -Dm755 shijima-qt $out
          export PATH=$PATH:$out/shijima-qt
        '';
      };
    })
  ];
}
