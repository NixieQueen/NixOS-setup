{ config, lib, pkgs, inputs, ... }:

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
  ];
}
