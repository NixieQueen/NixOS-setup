{ config, lib, pkgs, ... }:

{
  nixpkgs.overlays = [
    (final: prev: {
      lua-pam = (pkgs.luaPackages.lua-pam.override{}).overrideAttrs (oldAttrs: {
        nativeBuildInputs = with pkgs; [ cmake ];

        src = builtins.fetchGit {
          url = "https://github.com/RMTT/lua-pam.git";
          rev = "373de20d6784f77d59abc1ffc1d0302f28ed46cd";
        };

        buildPhase = ''
          cmake . -B build
          cd build
          make
        '';
        installPhase = ''
          runHook preInstall

          install -Dm755 liblua_pam.so $out/lib/lua/5.2/liblua_pam.so

          runHook postInstall
        '';

        meta = with lib; {
          description = "Lua module for PAM";
          homepage = "https://github.com/RMTT/lua-pam.git";
        };
      });
    })

                  #(final: prev: {
                  #  awesome-git = (pkgs.awesome.override { gtk3Support = true; }).overrideAttrs (oldAttrs: {
                  #    nativeBuildInputs = with pkgs; [ xorg.xcbutilerrors luajitPackages.busted asciidoctor luajitPackages.luacheck cmake imagemagick pkg-config luajitPackages.lgi luajitPackages.coxpcall luajitPackages.ldoc asciidoc ];
                  #    patches = [  ];
                  #    src = builtins.fetchGit {
                  #      url = "https://github.com/awesomeWM/awesome.git";
                  #      rev = "2682bcb2ed74e2e176d3a4fd9b197fd5f1693c33";
                  #      #sha256 = "FmORxY7SLFnAmtQyC82sK36RoUBa94rJ7BsDXjXUCXk=";
                  #    };
                  #    postPatch =
                  #      ''
                  #      patchShebangs tests/examples/_postprocess.lua
                  #      patchShebangs tests/examples/_postprocess_cleanup.lua
                  #      '';
                  #    cmakeFlags = oldAttrs.cmakeFlags ++ [ "-DGENERATE_MANPAGES=OFF" ];

                  #    GI_TYPELIB_PATH =
                  #      let
                  #        mkTypeLibPath = pkg: "${pkg}/lib/girepository-1.0";
                  #      in
                  #        prev.lib.concatStringsSep ":" ([ (mkTypeLibPath prev.pango.out) ]);

                      #installPhase =
                      #  ''
                      #  sudo make install
                      #  '';
                  #  });
                  #})

    (final: prev: {
      picom-ft-labs = prev.picom.overrideAttrs (oldAttrs: {
        nativeBuildInputs = with pkgs; [ asciidoc makeWrapper ninja pkg-config meson ];
        src = builtins.fetchGit {
          url = "https://github.com/FT-Labs/picom.git";
          rev = "df4c6a3d9b11e14ed7f3142540babea4c775ddb1";
          #sha256 = "FmORxY7SLFnAmtQyC82sK36RoUBa94rJ7BsDXjXUCXk=";
        };
        #buildPhase =
        #  ''
        #  meson setup --buildtype=release build
        #  ninja -C build install
        #  '';
        #installPhase =
        #  ''
        #  ninja -C build install
        #  '';
      });
    })
  ];
}
