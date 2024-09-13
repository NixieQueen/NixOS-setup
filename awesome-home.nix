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

  home.file.".config/awesome" = {
    source = builtins.fetchGit {
      url = "https://github.com/NixieQueen/awesomeWM-setup.git";
      rev = "8b7157ec4b8a7f32fab2fddcdfe6a48eb7e8ecdf";
      #allRefs = true;
    };
  };

  home.file.".p10k.zsh" = {
    source = ./setup/.p10k.zsh;
  };

  home.file.".config/autostart" = {
    source = ./setup/config/autostart;
    recursive = true;
  };
  home.file.".config/btop" = {
    source = ./setup/config/btop;
    recursive = true;
  };
  home.file.".config/doom" = {
    source = ./setup/config/doom;
    recursive = true;
  };
  home.file.".config/kitty" = {
    source = ./setup/config/kitty;
    recursive = true;
  };
  home.file.".config/picom" = {
    source = ./setup/config/picom;
    recursive = true;
  };
  home.file.".config/Thunar" = {
    source = ./setup/config/Thunar;
    recursive = true;
  };

  home.file.".Xresources" = {
    text = ''
      Xft.dpi: 96
      Xcursor.theme: Sweet-cursors
      Xcursor.size: 24
    '';
  };

  gtk = {
    enable = true;

    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme;
    };

    theme = {
      name = "palenight";
      package = pkgs.palenight-theme;
    };

    cursorTheme = {
      name = "Numix-Cursor";
      package = pkgs.numix-cursor-theme;
    };

    gtk3.extraConfig = {
      Settings = ''
        gtk-application-prefer-dark-theme=1
      '';
    };

    gtk4.extraConfig = {
      Settings = ''
        gtk-application-prefer-dark-theme=1
      '';
    };
  };

  home.sessionVariables.GTK_THEME = "palenight";

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
            src = ./setup/.p10k.zsh;
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
    btop
    picom-ft-labs

    # utils
    ripgrep
    dex

  ];
}
