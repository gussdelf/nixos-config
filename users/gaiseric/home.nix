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

    fzf = {
      enable = true;
      enableZshIntegration = true;
      defaultCommand = "fd -H -t f";
    };

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
            user_pref("svg.context-properties.content.enabled", true);
          '';
        };
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
