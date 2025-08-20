{ config, pkgs, lib, ... }:

{
  #xdg.userDirs = {
  #  enable = true;
  #  createDirectories = true;
  #};
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.nixie = {
    isNormalUser = true;
    extraGroups = [ "wheel" "scanner" "lp" "video" "audio" "networkmanager" "jackaudio" ]; # Enable ‘sudo’ for the user.
    initialPassword = "nixie";
    shell = pkgs.zsh;
    ignoreShellProgramCheck = true;
  };
}
