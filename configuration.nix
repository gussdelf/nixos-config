{ config, pkgs, ... }:

{
  imports = [ /etc/nixos/hardware-configuration.nix ];

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
    extraGroups = [ "wheel" "audio" "adbusers" ];
  };
  security.sudo.wheelNeedsPassword = false;
  users.users.gengar.shell = pkgs.zsh;
  programs.zsh.enableCompletion = true;

  nix.extraOptions = ''
    experimental-features = nix-command
  '';

  nixpkgs.overlays = [
    (import ./overlay.nix)
    (import (builtins.fetchTarball {
      url =
        "https://github.com/nix-community/neovim-nightly-overlay/archive/master.tar.gz";
    }))
  ];

  environment = {
    pathsToLink = [ "/share/zsh" ];
    systemPackages = with pkgs; [
      zsh
      psmisc
      fish
      ripgrep
      sxhkd
      polybar
      fd
      fzf
      go
      gopls
      sumneko-lua-language-server
      brave
      firefox
      exa
      starship
      lazygit
      git
      github-cli
      stow
      neofetch
      python3
      unzip
      tmux
      rsync
      picom
      curl
      wget
      xclip
      scrcpy
      feh
      sxiv
      zoxide
      gcc
      clang
      clang-tools
      binutils
      gnumake
      lxappearance
      capitaine-cursors
      tdesktop
      flameshot
      rofi
      htop
      shfmt
      stylua
      nixfmt
      ytfzf
      mpv
      shellcheck
      st-guss
      dmenu-guss
      rustup
      rust-analyzer
      zathura
      bitwarden
      catgirl
      deno
      yarn
      neovim-nightly
      cmus
    ];
  };
  virtualisation.podman.enable = true;

  system.stateVersion = "21.11";
}
