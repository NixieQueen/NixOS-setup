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
         awesomeNixieLaptop = lib.nixosSystem {
            inherit system;
            modules = [

              ./configurations/setups/overlays.nix

              #./configurations/setups/awesomewm/base
              ./configurations/setups/awesomewm-laptop/base

              home-manager.nixosModules.home-manager {
                home-manager.useGlobalPkgs = true;
                home-manager.backupFileExtension = "backup";
                home-manager.useUserPackages = true;
                home-manager.users.${user} = {
                  imports = [
                    #./configurations/setups/awesomewm/home
                    ./configurations/setups/awesomewm-laptop/home
                  ];
                };
              }
            ];
         };
       };
    };
}
