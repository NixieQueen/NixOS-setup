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
        user = "nixie";
        system = "x86_64-linux";
        pkgs = import nixpkgs {
             inherit system;
             config.allowUnfree = true;
        };
        lib = nixpkgs.lib;
    in {
       nixosConfigurations = {
         nixieos = lib.nixosSystem {
            inherit system;
            modules = [
                ./configuration.nix
                home-manager.nixosModules.home-manager {
                    home-manager.useGlobalPkgs = true;
                    home-manager.backupFileExtension = "backup";
                    home-manager.useUserPackages = true;
                    home-manager.users.${user} = {
                        imports = [ ./home.nix ];
                    };
                }
            ];
         };

         awesomeNixie = lib.nixosSystem {
            inherit system;
            modules = [

              {
                nixpkgs.overlays = [
                  nixpkgs-f2k.overlays.window-managers
                ];
              }

              ./awesome-configuration.nix
              home-manager.nixosModules.home-manager {
                home-manager.useGlobalPkgs = true;
                home-manager.backupFileExtension = "backup";
                home-manager.useUserPackages = true;
                home-manager.users.${user} = {
                  imports = [ ./awesome-home.nix ];
                };
              }
            ];
         };


         hyprnixie = lib.nixosSystem {
            inherit system;
            modules = [
                ./hypr-configuration.nix
                home-manager.nixosModules.home-manager {
                    home-manager.useGlobalPkgs = true;
                    home-manager.backupFileExtension = "backup";
                    home-manager.useUserPackages = true;
                    home-manager.users.${user} = {
                        imports = [ ./hypr-home.nix ];
                    };
                }
            ];
         };

       };
    };
}
