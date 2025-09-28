{ inputs, pkgs, ... }:

{
  imports = [inputs.ignis.homeManagerModules.default];

  programs.ignis = {
    enable = true;

    # Add to env for LSP
    addToPythonEnv = false; # May cause collisions :(

    # Config dir?
    #configDir = idk

    # Enable dependencies,
    # Won't affect system config, only toggle ignis' use of them
    services = {
      bluetooth.enable = true;
      recorder.enable = true;
      audio.enable = true;
      network.enable = true;
    };

    # Sass is now required
    sass = {
      enable = true;
      useDartSass = true; # No idea what dart sass is
    };

    extraPackages = with pkgs; [
      # In case extra python or regular scripts are required!
    ];
  };
}
