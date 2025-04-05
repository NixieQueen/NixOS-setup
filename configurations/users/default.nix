{ userDE, ... }:
let
  user1 = "nixie";
in
{
  home-manager.users.nixie.imports = [ ./${user1}/home-manager ../desktop-environments/${userDE}/dotfiles/${user1} ];
}
