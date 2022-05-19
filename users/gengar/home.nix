{ config, pkgs, ... }: {
  home = {
    username = "gengar";
    homeDirectory = "/home/gengar";
  };

  programs = {
    home-manager.enable = true;
    htop.enable = true;
    mpv.enable = true;
    exa.enable = true;
    zathura.enable = true;
    rofi.enable = true;
  };

  home.file = {
    ".config/nvim".source = ./config/nvim;
    ".config/tmux".source = ./config/tmux;
    ".config/doom".source = ./config/doom;
    ".config/sxhkd".source = ./config/sxhkd;
    ".config/bspwm".source = ./config/bpswm;
    ".config/xrdb".source = ./config/xrdb;
    ".config/rofi".source = ./config/rofi;
    ".config/zathura".source = ./config/zathura;
  };

  imports = [
    ./pkgs.nix
    ./programs/starship.nix
    ./programs/git.nix
    ./programs/zsh.nix
    ./programs/fzf.nix
    ./programs/zoxide.nix
    ./programs/bat.nix
    ./programs/helix.nix
    ./programs/firefox/default.nix
  ];

}
