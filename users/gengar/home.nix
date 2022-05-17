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

    firefox = {
      enable = true;

      extensions = with pkgs.nur.repos.rycee.firefox-addons; [
        ublock-origin
        stylus
        vimium
        darkreader
      ];

      profiles = {
        myprofile = {
          id = 0;
          settings = { "general.smoothScroll" = true; };
          extraConfig = ''
            user_pref("toolkit.legacyUserProfileCustomizations.stylesheets", true);
            user_pref("full-screen-api.ignore-widgets", true);
          '';
        };
      };
    };
  };

  imports = [
    ./pkgs.nix
    ./programs/starship.nix
    ./programs/git.nix
    ./programs/zsh.nix
    ./programs/fzf.nix
    ./programs/zoxide.nix
    ./programs/bat.nix
    # ./programs/polybar.nix
  ];

}
