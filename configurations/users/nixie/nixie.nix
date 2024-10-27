{ config, pkgs, lib, ... }:

{
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.nixie = {
    isNormalUser = true;
    extraGroups = [ "wheel" "scanner" "lp" "video" "audio" "networkmanager" ]; # Enable ‘sudo’ for the user.
    initialPassword = "nixie";
    shell = pkgs.zsh;
    ignoreShellProgramCheck = true;
  };

}
