{ config, pkgs, ... }:

{
  programs = {
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
          userChrome = import ./userChrome-css.nix;
          extraConfig = ''
            user_pref("toolkit.legacyUserProfileCustomizations.stylesheets", true);
            user_pref("full-screen-api.ignore-widgets", true);
            user_pref("svg.context-properties.content.enabled", true);
          '';
        };
      };
    };
  };
}
