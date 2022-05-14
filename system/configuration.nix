{ config, pkgs, ... }:

{
  imports = [ /etc/nixos/hardware-configuration.nix ];

  nix = {
    extraOptions = ''
      experimental-features = nix-command flakes
    '';
    package = pkgs.nixFlakes;
  };

  boot.loader = {
    grub.enable = true;
    grub.version = 2;
    grub.device = "/dev/sda";
  };

  time.timeZone = "America/Sao_Paulo";

  networking = {
    useDHCP = false;
    interfaces.enp0s29f0u2.useDHCP = true;
    interfaces.enp1s0.useDHCP = true;
    hostName = "boo";
  };

  i18n.defaultLocale = "pt_BR.UTF-8";
  console = { keyMap = "br-abnt2"; };

  nixpkgs.config.allowUnfree = true;

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
  nixpkgs.config.joypixels.acceptLicense = true;

  sound.enable = true;
  hardware.pulseaudio.enable = true;
  nixpkgs.config.pulseaudio = true;

  programs.adb.enable = true;

  users.users.gengar = {
    isNormalUser = true;
    shell = pkgs.zsh;
    home = "/home/gengar";
    extraGroups = [ "wheel" "audio" "adbusers" ];
  };

  security.sudo.wheelNeedsPassword = false;

  programs.zsh.enableCompletion = true;

  nixpkgs.overlays = [ (import ./overlay.nix) ];

  environment = {
    pathsToLink = [ "/share/zsh" ];
    systemPackages = with pkgs; [
      zsh
      psmisc
      fish
      ripgrep
      sxhkd
      fd
      go
      brave
      python3
      unzip
      tmux
      rsync
      curl
      wget
      xclip
      feh
      sxiv
      gcc
      clang
      clang-tools
      binutils
      gnumake
      flameshot
      nixfmt
      st-guss
      dmenu-guss
      rustup
      rust-analyzer
    ];
  };
  virtualisation.podman.enable = true;

  system.stateVersion = "21.11";
}
