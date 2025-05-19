{ config, lib, pkgs, ... }:

{
  nixpkgs.overlays = [
  
    # (final: prev: {
    #   lua-pam = (pkgs.luaPackages.lua-pam.override{}).overrideAttrs (oldAttrs: {
    #     nativeBuildInputs = with pkgs; [ cmake ];

    #     src = builtins.fetchGit {
    #       url = "https://github.com/RMTT/lua-pam.git";
    #       rev = "373de20d6784f77d59abc1ffc1d0302f28ed46cd";
    #     };

    #     buildPhase = ''
    #       cmake . -B build
    #       cd build
    #       make
    #     '';
    #     installPhase = ''
    #       runHook preInstall

    #       install -Dm755 liblua_pam.so $out/lib/lua/5.2/liblua_pam.so

    #       runHook postInstall
    #     '';

    #     meta = with lib; {
    #       description = "Lua module for PAM";
    #       homepage = "https://github.com/RMTT/lua-pam.git";
    #     };
    #   });
    # })

    (final: prev: {
      lightdm-webkit2 = pkgs.python3Packages.buildPythonApplication {
          name = "lightdm-webkit2";

          nativeBuildInputs = with pkgs; [
            rsync
            gnumake
            typescript
            sudo
            pkg-config
          ];
          dontWrapQtApps = true;
          
          buildInputs = with pkgs; [
            lightdm
            python312Packages.pygobject3
            python312Packages.pyqt5
            python312Packages.pyqtwebengine
            python312Packages.ruamel-yaml
            python312Packages.inotify
            #python312Packages.pyqt5
            libsForQt5.qt5.qtwebengine
            gobject-introspection
            xorg.libxcb
            xorg.libX11
          ];

          # unpackPhase
          # patchPhase
          # configurePhase
          # buildPhase
          # checkPhase
          # installPhase
          # fixupPhase
          # installCheckPhase
          # distPhase
   
          src = builtins.fetchGit {
              url = "https://github.com/JezerM/web-greeter.git";
              rev = "0bfa7f0036b2336c4d9aa9ad35e0777ab0b41857";
          };

          buildPhase = ''
            
          '';

          installPhase = ''
            sudo make install
          '';

          meta = with lib; {
              description = "webkit2 greeter for lightdm";
              homepage = "https://github.com/JezerM/web-greeter";
          };
      };
    })
  ];
}
