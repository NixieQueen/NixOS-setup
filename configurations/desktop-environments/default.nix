{ useWayland ? false, ... }:

{
  imports = if useWayland then
    [ /X11.nix ]
  else
    [ /Wayland.nix ];
}
