{ config, pkgs, ... }: {
  home = {
    username = "gaiseric";
    homeDirectory = "/home/gaiseric";
  };

  programs = {
    home-manager.enable = true;
    htop.enable = true;
  };

  imports = [ ./pkgs.nix ./programs/starship.nix /programs/zsh.nix ];
}
