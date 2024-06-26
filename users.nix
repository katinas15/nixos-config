{ pkgs, services, environment, xdg, ... }:

{
  # xdg.portal.enable = true;
  # xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  environment.systemPackages = with pkgs; [
     vim
     # xfce.xfce4-whiskermenu-plugin
     alsa-tools
     psmisc
  ];

  services.flatpak.enable = true; 
  users.users.l = {
    isNormalUser = true;
    description = "l";
    extraGroups = [ "networkmanager" "wheel" "docker" ];
    packages = with pkgs; [
      firefox
      kate
      steam
      discord
      lshw
      ntfs3g
      mangohud
      goverlay
      gh
      git
      lazygit
      neovim
      ncdu # folder disk space usage
      vlc
      pavucontrol
      qbittorrent
      isoimagewriter
      spotify
      nodejs
      wine
      wine64
      winetricks
      lutris
      gamemode
      steamPackages.steamcmd
      # dayz
      geoip
      whois
      #--
      docker
      lazydocker
      nerdfonts
      ripgrep
      xclip 
      neofetch
      vscodium
      gnused
      gnugrep
      sqlite
      xdg-utils
      coreutils
      findutils
      steamtinkerlaunch
      ryujinx
      # yuzu-mainline
      # yuzu-early-access
      hplip
      wget
      gnupg1orig
      apparmor-utils
      gparted
      btop
      pciutils
      virt-manager
      python312
      libsForQt5.ark
      unrar
      unzip
      brightnessctl
      openvpn3
      maim
      jetbrains.phpstorm
      # postman
      obs-studio
      appimage-run
      chromium
      vkbasalt
      wireplumber
      easyeffects
      gnumake
      docker-compose
      jetbrains.pycharm-community
      gnomeExtensions.pop-shell
      filezilla
      putty
    ];
  };
  programs.openvpn3.enable = true;

  fonts.fonts = with pkgs; [
    scientifica
    nerdfonts
    iosevka
    jetbrains-mono
  ];

  virtualisation = {
    docker = {
      enable = true;
      enableOnBoot = false;
    };
    # libvirtd = {
    #   enable = true;
    #   qemuOvmf = true;
    #   qemuRunAsRoot = false;
    #   onBoot = "ignore";
    #   onShutdown = "shutdown";
    # };
  };

  nixpkgs.overlays = [
    (self: super: {
      proton-ge = self.callPackage ./games/proton-ge.nix {};
    })
  ];

  system.activationScripts.proton-ge.text = ''
    mkdir -p /home/l/.steam/root/compatibilitytools.d/
    ln -sf ${pkgs.proton-ge}/share/proton-ge /home/l/.steam/root/compatibilitytools.d/GE-Proton8-16
  ''; 

  users.users.subsystem = {
    isNormalUser = true;
    description = "subsystem";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
      firefox
      steam
      ntfs3g
    ];
  };

}
