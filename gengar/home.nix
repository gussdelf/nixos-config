{ config, ... }:

{
  home = {
    username = "gengar";
    homeDirectory = "/home/gengar";
    stateVersion = "22.05";
  };

  programs = {
    home-manager.enable = true;
    htop.enable = true;
    mpv.enable = true;
  };

  imports = [
    ./pkgs.nix
    ./programs/starship.nix
    ./programs/git.nix
    ./programs/zsh.nix
    ./programs/fzf.nix
    ./programs/zoxide.nix
    ./programs/bat.nix
    ./programs/polybar.nix
  ];
}
