{ config, pkgs, ... }:

{
  # Pulseaudio needs to be disabled
  #services.pulseaudio.enable = false;

  environment.systemPackages = with pkgs; [ qjackctl ];

  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
    extraConfig = {
      pipewire."92-low-latency" = {
        "context.properties" = {
           "default.clock.rate" = 48000;
           "default.clock.quantum" = 1024;
           "default.clock.min-quantum" = 1024;
           "default.clock.max-quantum" = 1024;
        };
      };
      pipewire-pulse."92-low-latency" = {
         context.modules = [
           {
             name = "libpipewire-module-protocol-pulse";
             args = {
               pulse.min.req = "1024/48000";
               pulse.default.req = "1024/48000";
               pulse.max.req = "1024/48000";
               pulse.min.quantum = "1024/48000";
               pulse.max.quantum = "1024/48000";
             };
           }
         ];
         stream.properties = {
           node.latency = "1024/48000";
           resample.quality = 1;
         };
      };
    };
  };
}
