{ config, pkgs, ... }:

{
  imports = [ ./hardware-configuration.nix <home-manager/nixos> ];

  boot.loader.grub.enable = true;
  boot.loader.grub.version = 2;
  boot.loader.grub.device = "/dev/sda";

  networking.hostName = "nixos";

  time.timeZone = "America/Sao_Paulo";
  networking.useDHCP = false;
  networking.interfaces.enp0s29f0u2.useDHCP = true;
  networking.interfaces.enp1s0.useDHCP = true;

  i18n.defaultLocale = "pt_BR.UTF-8";
  console = { keyMap = "br-abnt2"; };

  nixpkgs.config.allowUnfree = true;

  hardware.opengl.enable = true;
  hardware.opengl.driSupport = true;

  services.xserver = {
    enable = true;
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

  services.xserver.layout = "br";
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
    #(import (builtins.fetchTarball {
    #  url =
    #    "https://github.com/nix-community/neovim-nightly-overlay/archive/master.tar.gz";
    #}))
  ];

  environment.systemPackages = with pkgs; [
    zsh
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
    bat
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
    emacs
    st-guss
    dmenu-guss
    rustup
    rust-analyzer
    zathura
    bitwarden
    catgirl
    spotify
    deno
    yarn
    neovim-nightly
  ];

  virtualisation.podman.enable = true;

  system.stateVersion = "21.11";
}
