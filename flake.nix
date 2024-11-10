{
  description = "nixie's first flake";

  inputs = {
    nixpkgs-f2k.url = "github:fortuneteller2k/nixpkgs-f2k";
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    home-manager = {
        url = github:nix-community/home-manager;
        inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprland.url = "github:hyprwm/Hyprland";
    hyprland-plugins = {
      url = "github:hyprwm/hyprland-plugins";
      inputs.hyprland.follows = "hyprland";
    };
    swww.url = "github:LGFae/swww";
  };

  outputs = { self, nixpkgs, hyprland, home-manager, nixpkgs-f2k, ... } @ inputs:
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
              {
                nixpkgs.overlays = [ nixpkgs-f2k.overlays.window-managers ];
              }
              {
                networking.hostName = "awesomeNixieLaptop";
              }
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

          hyprNixieLaptop = lib.nixosSystem {
            specialArgs = { inherit inputs; inherit user; };
            inherit system;
            modules = [

              ./configurations/setups/overlays.nix
              {
                #nixpkgs.overlays = [ nixpkgs-f2k.overlays.window-managers ];
              }
              {
                networking.hostName = "hyprNixieLaptop";
              }
              ./configurations/setups/hyprland-laptop/base

              home-manager.nixosModules.home-manager {
                home-manager.extraSpecialArgs = { inherit inputs; inherit user; };
                home-manager.useGlobalPkgs = true;
                home-manager.backupFileExtension = "backup";
                home-manager.useUserPackages = true;
                home-manager.users.${user} = {
                  imports = [
                    ./configurations/setups/hyprland-laptop/home
                  ];
                };
              }
            ];
         };


       };
    };
}
