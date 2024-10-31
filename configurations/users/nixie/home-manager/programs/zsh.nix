{ config, lib, pkgs, ... }:

{
  programs = {
     zsh = {
        enable = true;
        enableCompletion = true;
        autosuggestion.enable = true;
        syntaxHighlighting.enable = true;

        shellAliases = {
            update = "cd ~/nixosConfig && sudo nixos-rebuild switch --flake .# && doom upgrade";
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
            src = ../dotfiles/base/home-folder/.p10k.zsh;
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
}
