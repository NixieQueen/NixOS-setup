{ config, pkgs, ... }:

{
  # Home manager needs info on your user and its paths!
  home.username = "nixie";
  home.homeDirectory = "/home/nixie";

  # This value changes the version of home. Leave it alone if you don't know what you're doing!
  home.stateVersion = "23.11";

  programs.home-manager.enable = true;

#  xdg.dataFile."applications/doom.desktop" = {
#    text = ''
#    [Desktop Entry]
#    Name=doom-emacs
#    GenericName=text editor
#    Comment=Starts the doom-emacs client
#    Exec=doom run
#    Icon=emacs
#    Terminal=false
#    Type=Application
#    StartupNotify=true
#    '';
#  };

  home.file.".p10k.zsh" = {
    source = ./.p10k.zsh;
  };
  home.file.".config" = {
    source = ./config;
    recursive = true;
  };

  programs = {
    git = {
      enable = true;
      userName = "NixieQueen";
      userEmail = "thestampyliker@gmail.com";
    };

    librewolf = {
      enable = true;
      settings = {
        "webgl.disabled" = true;
        "privacy.resistFingerprinting" = true;
        "privacy.clearOnShutdown.history" = true;
        "privacy.clearOnShutdown.cookies" = true;
      };
    };

    zsh = {
        enable = true;
        enableCompletion = true;
        autosuggestion.enable = true;
        syntaxHighlighting.enable = true;

        shellAliases = {
            update = "cd ~/nixosConfig && sudo nixos-rebuild switch --flake .#";
            fetch = "clear && neofetch";
            emacs = "doom run";
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

    # utils
    ripgrep
  ];
}
