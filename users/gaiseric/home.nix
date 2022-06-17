{ config, pkgs, ... }: {
  home = {
    username = "gaiseric";
    homeDirectory = "/home/gaiseric";
    sessionVariables = {
      XAUTHORITY = "${config.home.homeDirectory}/.config/xauthority";
      RUSTUP_HOME = "$XDG_DATA_HOME/rustup";
      GOPATH = "$XDG_DATA_HOME/go";
    };
  };

  xdg = {
    enable = true;
    cacheHome = "${config.home.homeDirectory}/.cache";
    dataHome = "${config.home.homeDirectory}/.local/share";
    configHome = "${config.home.homeDirectory}/.config";
  };

  gtk.gtk2.configLocation = "${config.xdg.configHome}/gtk-2.0/gtkrc";

  programs = {
    home-manager.enable = true;
    htop.enable = true;

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
      enableBashIntegration = true;
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

  home.file = { ".config/xrdb".source = ./config/xrdb; };

  imports = [
    ./pkgs.nix
    ./programs/starship.nix
    ./programs/bash.nix
    ./programs/git.nix
    ./programs/helix.nix
    ./programs/sway.nix
  ];
}
