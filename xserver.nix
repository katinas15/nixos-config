{ services, pkgs, ... }:

{
  services.xserver = {
    enable = true;
    layout = "us";
    xkbVariant = "";
    desktopManager = {
      xterm.enable = false;
      lxqt = {
        enable = true;
      };
    };

    windowManager = {
       i3 = {
          enable = true;
          configFile = /etc/nixos/i3-config;
       };
    };

    displayManager = {
       # sddm.enable = true; 
      lightdm.enable = true; 
    };
  };
}
