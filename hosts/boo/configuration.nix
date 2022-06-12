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
  console = { keyMap = "br-abnt2"; };

  hardware.opengl = {
    enable = true;
    driSupport = true;
  };

  services.xserver = {
    enable = true;
    layout = "br";
    displayManager.startx.enable = true;
    windowManager.bspwm.enable = true;
    windowManager.awesome.enable = true;
    videoDrivers = [ "intel" ];
    libinput.enable = true;
  };

  fonts.fonts = with pkgs; [
    nerdfonts
    joypixels
    material-design-icons
    font-awesome
  ];

  sound.enable = true;
  hardware.pulseaudio.enable = true;

  programs.adb.enable = true;

  users.users = {

    gengar = {
      isNormalUser = true;
      shell = pkgs.zsh;
      home = "/home/gengar";
      extraGroups = [ "wheel" "audio" "adbusers" ];
    };

    gaiseric = {
      isNormalUser = true;
      shell = pkgs.zsh;
      home = "/home/gaiseric";
      extraGroups = [ "wheel" "audio" "adbusers" ];
    };

  };

  security.sudo.wheelNeedsPassword = false;

  programs.zsh.enableCompletion = true;

  environment = {
    pathsToLink = [ "/share/zsh" ];
    systemPackages = with pkgs; [
      zsh
      psmisc
      ripgrep
      sxhkd
      fd
      go
      python3Full
      unzip
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
      rustup
      texlive.combined.scheme-full
    ];
  };

  virtualisation.podman.enable = true;

  system.stateVersion = "22.05";
}
