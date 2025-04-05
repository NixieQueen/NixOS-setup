{ config, lib, pkgs, inputs, ... }:

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
      lightdm-webkit2 = (pkgs.lightdm-mini-greeter.override{}).overrideAttrs (oldAttrs: {
        nativeBuildInputs = with pkgs; [ gtk3 webkit2-sharp lightdm dbus-glib ninja ];

        src = buildins.fetchGit {
          url = "https://github.com/MerkeX/Lightdm-webkit2-greeter";
          rev = "4549fd31e540a0fe7d4f21d8e18e6ef3f15875d6";
        };

        buildPhase = ''
git clone https://github.com/MerkeX/lightdm-webkit2-greeter.git /tmp/greeter
cd /tmp/greeter/build
#git checkout ${LATEST_RELEASE_TAG} # eg. git checkout 2.2
git checkout stable
meson --prefix=/usr --libdir=lib ..
ninja
        '';

        installPhase = ''
sudo ninja install
        '';

        meta = with lib; {
          description = "webkit2 greeter for lightdm";
          homepage = "https://github.com/MerkeX/Lightdm-webkit2-greeter";
        };
      });
    })
  ];
}
