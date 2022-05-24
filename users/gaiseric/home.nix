{ config, pkgs, ... }: {
  home = {
    username = "gaiseric";
    homeDirectory = "/home/gaiseric";
  };

  programs = {
    home-manager.enable = true;
    htop.enable = true;
    git.enable = true;
    zoxide = {
      enable = true;
      enableBashIntegration = true;
      enableZshIntegration = true;
      options = [ "--cmd j" ];
    };
    bat = {
      enable = true;
      config = {
        pager = "never";
        style = "plain";
        theme = "base16";
      };
    };

  };

  imports = [
    ./pkgs.nix
    ./programs/starship.nix
    ./programs/zsh.nix
    ./programs/git.nix
  ];
}
