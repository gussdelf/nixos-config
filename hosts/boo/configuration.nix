{ config, pkgs, lib, ... }:

{
  imports = [ ./hardware-configuration.nix ];

  nix = {
    extraOptions = ''
      experimental-features = nix-command flakes
    '';
    package = pkgs.nixFlakes;
  };

  boot.loader.grub = {
    enable = true;
    version = 2;
    device = "/dev/sda";
  };

  time.timeZone = "America/Sao_Paulo";

  networking = {
    useDHCP = false;
    interfaces = {
      enp0s29f0u2.useDHCP = true;
      enp1s0.useDHCP = true;
    };
    hostName = "boo";
  };

  i18n.defaultLocale = "pt_BR.UTF-8";
  console = { useXkbConfig = true; };

  hardware.opengl = {
    enable = true;
    driSupport = true;
  };

  services.xserver = {
    enable = true;
    layout = "br";
    xkbOptions = "ctrl:swapcaps";
    windowManager.bspwm.enable = true;
    windowManager.awesome.enable = true;
    displayManager.startx.enable = true;
    videoDrivers = [ "intel" ];
    libinput.enable = true;
  };

  fonts = {
    fonts = with pkgs; [
      nerdfonts
      joypixels
      material-design-icons
      font-awesome
    ];

    fontconfig = {
      enable = true;
      defaultFonts = { monospace = [ "JetBrainsMono Nerd Font Mono" ]; };
    };
  };

  sound.enable = true;
  # hardware.pulseaudio.enable = true;

  services.pipewire = {
    enable = true;
    alsa.enable = true;
    pulse.enable = true;
  };

  programs = {
    adb.enable = true;
    dconf.enable = true;
  };

  systemd.user.services = {
    pipewire.wantedBy = [ "default.target" ];
    pipewire-pulse.wantedBy = [ "default.target" ];
  };

  users = {
    defaultUserShell = pkgs.zsh;

    users = {
      gengar = {
        isNormalUser = true;
        home = "/home/gengar";
        extraGroups = [ "wheel" "audio" "adbusers" ];
      };

      gaiseric = {
        isNormalUser = true;
        home = "/home/gaiseric";
        extraGroups = [ "wheel" "audio" "adbusers" ];
      };
    };
  };

  security.sudo.wheelNeedsPassword = false;

  environment = {
    shells = with pkgs; [ zsh ];
    pathsToLink = [ "/share/zsh" ];
    systemPackages = with pkgs; [
      man-pages
      man-pages-posix
      zsh
      psmisc
      ripgrep
      sxhkd
      fd
      go
      python3Full
      unzip
      unrar
      p7zip
      tmux
      rsync
      curl
      wget
      gcc
      clang
      clang-tools
      binutils
      gnumake
      nixfmt
      nix-prefetch-github
      rustup
      texlive.combined.scheme-full
    ];
  };

  virtualisation.podman.enable = true;

  system.stateVersion = "22.05";
}
