{ config, pkgs, ... }: {
  programs.zsh = {
    enable = true;
    enableAutosuggestions = true;
    enableCompletion = true;
    enableSyntaxHighlighting = true;
    autocd = true;
    defaultKeymap = "viins";
    dirHashes = {
      docs = "$HOME/Docs";
      dl = "$HOME/Files";
      pj = "$HOME/Projects";
      rep = "$HOME/Repos";
    };
    dotDir = ".config/zsh";
    history = {
      ignoreDups = true;
      extended = true;
      path = "$HOME/.local/share/zsh/history";
    };
    plugins = [{
      name = "hlissner/zsh-autopair";
      file = "autopair.zsh";
      src = fetchGit { url = "https://github.com/hlissner/zsh-autopair.git"; };
    }];
    localVariables = {
      VISUAL = "emacsclient -nc";
      EDITOR = "nvim";
      LC_CTYPE = "pt_BR.UTF-8";
      GOPATH = "$XDG_DATA_HOME/go";
      PATH =
        "$HOME/.local/bin:/usr/local/bin:$GOPATH/bin:$HOME/.local/bin:$CARGO_HOME/bin:$XDG_DATA_HOME/npm/bin:$PATH";
      XDG_CONFIG_HOME = "$HOME/.config";
      XDG_CACHE_HOME = "$HOME/.cache";
      XDG_DATA_HOME = "$HOME/.local/share";
      CARGO_HOME = "$XDG_DATA_HOME/cargo";
      GTK_RC_FILES = "$XDG_CONFIG_HOME/gtk-1.0/gtkrc";
      GTK2_RC_FILES = "$XDG_CONFIG_HOME/gtk-2.0/gtkrc";
      _Z_DATA = "$XDG_DATA_HOME/z";
      LESSKEY = "$XDG_CONFIG_HOME/less/lesskey";
      LESSHISTFILE = "$XDG_CACHE_HOME/less/history";
      ZDOTDIR = "$HOME/.config/zsh";
      ANDROID_SDK_HOME = "$XDG_CONFIG_HOME/android";
      WGETRC = "$XDG_CONFIG_HOME/wgetrc";
      TMUX_TMPDIR = "$XDG_RUNTIME_DIR";
      XINITRC = "$XDG_CONFIG_HOME/X11/xinitrc";
      NPM_CONFIG_USERCONFIG = "$XDG_CONFIG_HOME/npm/npmrc";
      RUSTUP_HOME = "$XDG_DATA_HOME/rustup";
      GEM_HOME = "$XDG_DATA_HOME/gem";
      GEM_SPEC_CACHE = "$XDG_CACHE_HOME/gem";
      GNUPGHOME = "$XDG_DATA_HOME/gnupg";
      TERMINFO = "$XDG_DATA_HOME/terminfo";
      TERMINFO_DIRS = "$XDG_DATA_HOME/terminfo:/usr/share/terminfo";
      NODE_REPL_HISTORY = "$XDG_DATA_HOME/node_repl_history";
      PASSWORD_STORE_DIR = "$XDG_DATA_HOME/pass";
      SPACEMACSDIR = "$XDG_CONFIG_HOME/spacemacs.d";
      NOTMUCH_CONFIG = "$XDG_CONFIG_HOME/notmuch/notmuchrc";
      NMBGIT = "$XDG_DATA_HOME/notmuch/nmbug";
      ASDF_DATA_DIR = "$XDG_DATA_HOME/asdf";
      ASDF_CONFIG_FILE = "$XDG_CONFIG_HOME/config/asdf/asdfrc";
      WLR_NO_HARDWARE_CURSORS = 1;
      KEYTIMEOUT = 1;
    };
    shellAliases = {
      c = "clear;";
      n = "nnn -e";
      g = "git";
      xx = "chmod +x";
      ww = "wget";
      lz = "lazygit";
      se = "sudoedit";
      nw = "newsboat";
      nf = "neofetch";
      cp = "rsync";
      uf = "ufetch";
      hee = "home-manager edit";
      cmd = "command";
      doo = "doas";
      del = "doas rm -rf";
      zzz = "systemctl suspend";
      bat = "bat --style plain -P --theme base16";
      use = "xrdb merge";
      load = "kill -USR1 $(pidof st)";
      nixc = "$EDITOR ~/Projects/nixos-config/configuration.nix";
      mutt = "neomutt";
      magit = ''emacsclient -nc -e "(magit-status)"'';
      mkdir = "mkdir -p";
      flake = "nix flake";
      server = "python -m http.server";
      bspwm = "startx ~/.config/X11/bspwm";
      awesomewm = "startx ~/.config/X11/awesome";
      pcomp = "nvim +PackerCompile";
      psync = "nvim +PackerSync";
    };
    initExtra = ''
      zstyle ':completion:*' menu select
      _comp_options+=(globdots)
      bindkey '^H' backward-delete-char
      bindkey '^L' autosuggest-accept
      bindkey '^K' up-line-or-history
      bindkey '^J' down-line-or-history
      bindkey '^O' fzf-cd-widget

      function etangle() {
        emacs --batch --eval "(progn (require 'org) (setq org-confirm-babel-evaluate nil) (org-babel-tangle-file \"$1\"))"
      }

      function passs() {
        pass $1 | xclip -sel clip
      }

      fuzzy-xdg-open() {
        local output
        output=$(fzf --height 50% --reverse </dev/tty) && $EDITOR ''${(q-)output}
        zle reset-prompt
      }
      zle -N fuzzy-xdg-open

      bindkey '^F' fuzzy-xdg-open
    '';
  };
}
