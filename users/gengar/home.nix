{ config, pkgs, ... }: {
  xdg = {
    enable = true;
    cacheHome = "${config.home.homeDirectory}/.cache";
    dataHome = "${config.home.homeDirectory}/.local/share";
    configHome = "${config.home.homeDirectory}/.config";
    userDirs = {
      enable = true;
      documents = "$HOME/Docs";
      download = "$HOME/Files";
      pictures = "$HOME/Imgs";
      music = "$HOME/Files/Music";
    };
  };

  home = {
    username = "gengar";
    homeDirectory = "/home/gengar";
    sessionVariables = {
      XAUTHORITY = "${config.xdg.configHome}/Xauthority";
      RUSTUP_HOME = "${config.xdg.dataHome}/rustup";
      CARGO_HOME = "${config.xdg.dataHome}/cargo";
      GOPATH = "${config.xdg.dataHome}/go";
    };
  };

  fonts.fontconfig.enable = true;

  gtk = {
    enable = true;
    gtk2.configLocation = "${config.xdg.configHome}/gtk-2.0/gtkrc";
    cursorTheme = {
      name = "capitaine-cursors-white";
      package = pkgs.capitaine-cursors;
    };
  };

  programs = {
    home-manager.enable = true;
    htop.enable = true;
    mpv.enable = true;
    exa.enable = true;
    zathura.enable = true;
    rofi.enable = true;
  };

  services.flameshot = {
    enable = true;
    settings = {
      General = {
        disabledTrayIcon = false;
        showStartupLaunchMessage = false;
        savePath = config.xdg.userDirs.pictures;
      };
    };
  };

  home.file = {
    # Some raw configs
    ".config/tmux".source = ./config/tmux;
    ".config/xrdb".source = ./config/xrdb;
    ".config/rofi".source = ./config/rofi;
    ".config/zathura".source = ./config/zathura;
    ".config/polybar".source = ./config/polybar;
    ".config/sxhkd".source = ./config/sxhkd;
    ".config/bspwm".source = ./config/bspwm;
    #".config/awesome".source = ./config/awesome;
    ".config/mupen64plus".source = ./config/mupen64plus;

    # Wallpapers
    "Imgs/wallpapers".source = ./wallpapers;
  };

  imports = [
    ./pkgs.nix
    ./programs/nnn.nix
    ./programs/git.nix
    ./programs/bat.nix
    ./programs/zsh.nix
    ./programs/fzf.nix
    ./programs/fish.nix
    ./programs/starship.nix
    ./programs/zoxide.nix
    ./programs/firefox/default.nix

    # the trinity
    ./programs/neovim.nix
    ./programs/helix.nix
    ./programs/emacs.nix
  ];

}
