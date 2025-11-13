{
  description = "nixie's first flake";

  nixConfig = {
    substituters = [
      #"https://nix-qchem.cachix.org"
      #"https://cosmic.cachix.org"
      #"https://hyprland.cachix.org"
      "https://nix-community.cachix.org"
      "https://cache.nixos.org/"
    ];

    trusted-public-keys = [
      #"nix-qchem.cachix.org-1:ZjRh1PosWRj7qf3eukj4IxjhyXx6ZwJbXvvFk3o3Eos="
      #"cosmic.cachix.org-1:Dya9IyXD4xdBehWjrkPv6rtxpmMdRel02smYzA85dPE="
      #"hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
    ];
  };

  inputs = {
    #picom.url = "github:yshui/picom";
    nixpkgs-f2k.url = "github:fortuneteller2k/nixpkgs-f2k"; ## Awesomewm
    #nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-25.05";
    home-manager = {
        url = "github:nix-community/home-manager/release-25.05";
        inputs.nixpkgs.follows = "nixpkgs";
    };
    spicetify-nix.url = "github:Gerg-L/spicetify-nix";
    spicetify-nix.inputs.nixpkgs.follows = "nixpkgs";
    #hyprland.url = "github:hyprwm/Hyprland";
    #hyprland-plugins = {
    #  url = "github:hyprwm/hyprland-plugins";
    #  inputs.hyprland.follows = "hyprland";
    #};
    #swww.url = "github:LGFae/swww";
    ignis = {
      url = "github:ignis-sh/ignis";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hexecute.url = "github:ThatOtherAndrew/Hexecute";
    #nixpkgs.follows = "nixos-cosmic/nixpkgs";
    #nixos-cosmic.url = "github:lilyinstarlight/nixos-cosmic";
    #qchem = {
    #  url = "github:Nix-QChem/NixOS-QChem";
    #  inputs.nixpkgs.follows = "nixpkgs";
    #};
    zotero-nix.url = "github:camillemndn/zotero-nix";
    nix-flatpak = {
      url = "github:gmodena/nix-flatpak/?ref=latest";
      #inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, nixpkgs-f2k, nix-flatpak, zotero-nix, ... } @ inputs:
    let
        system = "x86_64-linux";
        pkgs = import nixpkgs {
             inherit system;
             config.allowUnfree = true;
        };
        lib = nixpkgs.lib;
    in {
      nixosConfigurations = {
        NixieOSAwesome = lib.nixosSystem {
          specialArgs = { inherit inputs; computerType = "laptop"; userDE = "awesomewm"; };
          inherit system;
          modules = [

            {
              networking.hostName = "NixieOSAwesome";
            }

            ./configurations/desktop-environments/awesomewm
            ./configurations/overlays
            ./configurations/system
            ./configurations/users/users.nix

            home-manager.nixosModules.home-manager {
              home-manager.extraSpecialArgs = { inherit inputs; computerType = "laptop"; userDE = "awesomewm"; };
              home-manager.useGlobalPkgs = true;
              home-manager.backupFileExtension = "backup";
              home-manager.useUserPackages = true;
            }

            ./configurations/users
          ];
        };

        NixieOSLHyprland = lib.nixosSystem {
          specialArgs = { inherit inputs; computerType = "laptop"; userDE = "hyprland"; };
          inherit system;
          modules = [

            {
              networking.hostName = "NixieOSLHyprland";
            }

            nix-flatpak.nixosModules.nix-flatpak

            ./configurations/desktop-environments/hyprland
            ./configurations/overlays
            ./configurations/system
            ./configurations/users/users.nix

            home-manager.nixosModules.home-manager {
              home-manager.extraSpecialArgs = { inherit inputs; computerType = "laptop"; userDE = "hyprland"; };
              home-manager.useGlobalPkgs = true;
              home-manager.backupFileExtension = "backup";
              home-manager.useUserPackages = true;
            }

            ./configurations/users
          ];
        };

        NixieOSDHyprland = lib.nixosSystem {
          specialArgs = { inherit inputs; computerType = "desktop"; userDE = "hyprland"; };
          inherit system;
          modules = [

            {
              networking.hostName = "NixieOSDHyprland";
            }

            nix-flatpak.nixosModules.nix-flatpak

            ./configurations/desktop-environments/hyprland
            ./configurations/overlays
            ./configurations/system
            ./configurations/users/users.nix

            home-manager.nixosModules.home-manager {
              home-manager.extraSpecialArgs = { inherit inputs; computerType = "desktop"; userDE = "hyprland"; };
              home-manager.useGlobalPkgs = true;
              home-manager.backupFileExtension = "backup";
              home-manager.useUserPackages = true;
            }

            ./configurations/users
          ];
        };

        NixieOSDNiri = lib.nixosSystem {
          specialArgs = { inherit inputs; computerType = "desktop"; userDE = "niri"; };
          inherit system;
          modules = [

            {
              networking.hostName = "NixieOSDNiri";
            }

            nix-flatpak.nixosModules.nix-flatpak

            ./configurations/desktop-environments/niri
            ./configurations/overlays
            ./configurations/system
            ./configurations/users/users.nix

            home-manager.nixosModules.home-manager {
              home-manager.extraSpecialArgs = { inherit inputs; computerType = "desktop"; userDE = "niri"; };
              home-manager.useGlobalPkgs = true;
              home-manager.backupFileExtension = "backup";
              home-manager.useUserPackages = true;
            }

            ./configurations/users
          ];
        };

        NixieOSLNiri = lib.nixosSystem {
          specialArgs = { inherit inputs; computerType = "laptop"; userDE = "niri"; };
          inherit system;
          modules = [

            {
              networking.hostName = "NixieOSLNiri";
            }

            nix-flatpak.nixosModules.nix-flatpak

            ./configurations/desktop-environments/niri
            ./configurations/overlays
            ./configurations/system
            ./configurations/users/users.nix

            home-manager.nixosModules.home-manager {
              home-manager.extraSpecialArgs = { inherit inputs; computerType = "laptop"; userDE = "niri"; };
              home-manager.useGlobalPkgs = true;
              home-manager.backupFileExtension = "backup";
              home-manager.useUserPackages = true;
            }

            ./configurations/users
          ];
        };


        NixieOSCosmic = lib.nixosSystem {
          specialArgs = { inherit inputs; computerType = "laptop"; userDE = "cosmic"; };
          inherit system;
          modules = [

            {
              networking.hostName = "NixieOSCosmic";
            }

            ./configurations/desktop-environments/cosmic
            ./configurations/overlays
            inputs.nixos-cosmic.nixosModules.default
            ./configurations/system
            ./configurations/users/users.nix

            home-manager.nixosModules.home-manager {
              home-manager.extraSpecialArgs = { inherit inputs; computerType = "laptop"; userDE = "cosmic"; };
              home-manager.useGlobalPkgs = true;
              home-manager.backupFileExtension = "backup";
              home-manager.useUserPackages = true;
            }

            ./configurations/users
          ];
        };

      };
    };
}
