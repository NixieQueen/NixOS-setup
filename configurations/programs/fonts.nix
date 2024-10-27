{ config, pkgs, ... }:

{
  fonts.package = with pkgs; [
    liberation_ttf
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-emoji
    liberation_ttf
    fira-code
    fira-code-symbols
    fira-sans
  ];
}
