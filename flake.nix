{
  description = "nixie's first flake";

  inputs = {
    nixpkgs-f2k.url = "github:fortuneteller2k/nixpkgs-f2k";
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    home-manager = {
        url = github:nix-community/home-manager;
        inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, nixpkgs-f2k }:
    let
        hostname = "nixieFramework";
        laptopConfig = "laptop";
        desktopConfig = "desktop";
        user = "nixie";
        homeDirectory = "/home/nixie";
        system = "x86_64-linux";
        pkgs = import nixpkgs {
             inherit system;
             config.allowUnfree = true;
        };
        lib = nixpkgs.lib;
    in {
       nixosConfigurations = {
         awesomeNixie = lib.nixosSystem {
            inherit system;
            modules = [

              {
                nixpkgs.overlays = [
	                nixpkgs-f2k.overlays.window-managers # window managers such as awesome or river

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

              #./configurations/setups/awesomewm/base
              ./awesome-configuration.nix

              home-manager.nixosModules.home-manager {
                home-manager.useGlobalPkgs = true;
                home-manager.backupFileExtension = "backup";
                home-manager.useUserPackages = true;
                home-manager.users.${user} = {
                  imports = [
                    #./configurations/setups/awesomewm/home
                    ./awesome-home.nix
                  ];
                };
              }
            ];
         };
       };
    };
}
