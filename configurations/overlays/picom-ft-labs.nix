{ config, lib, pkgs, inputs, ... }:

{
  nixpkgs.overlays = [
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
