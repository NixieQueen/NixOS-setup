{
  description = "nixie's first flake";

  inputs = {
    #picom.url = "github:yshui/picom";
    nixpkgs-f2k.url = "github:fortuneteller2k/nixpkgs-f2k";
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    home-manager = {
        url = github:nix-community/home-manager;
        inputs.nixpkgs.follows = "nixpkgs";
    };
    spicetify-nix.url = "github:Gerg-L/spicetify-nix";
    spicetify-nix.inputs.nixpkgs.follows = "nixpkgs";
    hyprland.url = "github:hyprwm/Hyprland";
    hyprland-plugins = {
      url = "github:hyprwm/hyprland-plugins";
      inputs.hyprland.follows = "hyprland";
    };
    swww.url = "github:LGFae/swww";
    ignis.url = "github:linkfrg/ignis";
    nixpkgs.follows = "nixos-cosmic/nixpkgs";
    nixos-cosmic.url = "github:lilyinstarlight/nixos-cosmic";
    qchem = {
      url = "github:Nix-QChem/NixOS-QChem";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  nixConfig = {
    extra-substituters = [
      "https://cosmic.cachix.org/"
    ];
    extra-trusted-public-keys = [
      "cosmic.cachix.org-1:Dya9IyXD4xdBehWjrkPv6rtxpmMdRel02smYzA85dPE="
    ];
  };

  outputs = { self, nixpkgs, home-manager, nixpkgs-f2k, nixos-cosmic, qchem, ... } @ inputs:
    let
        computerType = "laptop";  # Can be laptop or desktop
        system = "x86_64-linux";
        pkgs = import nixpkgs {
             inherit system;
             config.allowUnfree = true;
        };
        lib = nixpkgs.lib;
    in {
       nixosConfigurations = {
         NixieOSAwesome = lib.nixosSystem {
            specialArgs = { inherit inputs; inherit computerType; userDE = "awesomewm"; };
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
                home-manager.extraSpecialArgs = { inherit inputs; userDE = "awesomewm"; };
                home-manager.useGlobalPkgs = true;
                home-manager.backupFileExtension = "backup";
                home-manager.useUserPackages = true;
              }

              ./configurations/users
            ];
         };

          NixieOSHyprland = lib.nixosSystem {
            specialArgs = { inherit inputs; inherit computerType; userDE = "hyprland"; };
            inherit system;
            modules = [

              {
                networking.hostName = "NixieOSHyprland";
              }

              ./configurations/desktop-environments/hyprland
              ./configurations/overlays
              ./configurations/system
              ./configurations/users/users.nix

              home-manager.nixosModules.home-manager {
                home-manager.extraSpecialArgs = { inherit inputs; userDE = "hyprland"; };
                home-manager.useGlobalPkgs = true;
                home-manager.backupFileExtension = "backup";
                home-manager.useUserPackages = true;
              }

              ./configurations/users
            ];
         };

          NixieOSCosmic = lib.nixosSystem {
            specialArgs = { inherit inputs; inherit computerType; userDE = "cosmic"; };
            inherit system;
            modules = [

              {
                networking.hostName = "NixieOSCosmic";
              }

              ./configurations/desktop-environments/cosmic
              ./configurations/overlays
              nixos-cosmic.nixosModules.default
              ./configurations/system
              ./configurations/users/users.nix

              home-manager.nixosModules.home-manager {
                home-manager.extraSpecialArgs = { inherit inputs; userDE = "cosmic"; };
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
