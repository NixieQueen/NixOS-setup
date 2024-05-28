{ config, pkgs, ... }:

{
  # Home manager needs info on your user and its paths!
  home.username = "nixie";
  home.homeDirectory = "/home/nixie";

  # This value changes the version of home. Leave it alone if you don't know what you're doing!
  home.stateVersion = "23.11";

  programs.home-manager.enable = true;

  home.file.".config/hypr" = {
    source = "${
                (pkgs.fetchFromGitHub {
                  owner = "prasanthrangan";
                  repo = "hyprdots";
                  rev = "681ef854db065dc7624b2be3742c075d02889b83";
                  sha256 = "Iy2ptZidiRRfJd8rKkPHHGcKYTpZnP043WS9Eu+dymk=";
                })}/Configs/.config/hypr/";
  };

  home.file.".p10k.zsh" = {
    source = ./.p10k.zsh;
  };
  home.file.".config/doom" = {
    source = ./doom;
    recursive = true;
  };

  programs = {
    zsh = {
        enable = true;
        enableCompletion = true;
        autosuggestion.enable = true;
        syntaxHighlighting.enable = true;

        shellAliases = {
            update = "cd ~/nixosConfig && sudo nixos-rebuild switch --flake .#";
            fetch = "clear && neofetch";
        };
        history.size = 10000;
        #history.path = config.xdg.dataHome/zsh/history;

        plugins = [
        {
            name = "zsh-powerlevel10k";
            src = pkgs.zsh-powerlevel10k;
            file = "share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
        }
        {
            name = "powerlevel10k-config";
            src = ./.p10k.zsh;
            file = "p10k.zsh";
        }
        ];

        initExtra = ''
        export PATH=$PATH:/$HOME/.config/emacs/bin/

        bindkey "^[[1;5C" forward-word
        bindkey "^[[1;5D" backward-word
        bindkey  "^[[H"   beginning-of-line
        bindkey  "^[[F"   end-of-line
        bindkey  "^[[3~"  delete-char

        [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
        '';
    };
  };

  home.packages = with pkgs; [
    discord
  ];
}
