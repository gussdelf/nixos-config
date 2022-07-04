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
    localVariables = { KEYTIMEOUT = 1; };
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
      ls = "exa -s type --git --icons";
      ll = "exa -s type -l --git --icons";
      la = "exa -s type -la --git --icons";
      lla = "exa -s type -la --git --icons";
      lsa = "exa -s type -a --git --icons";
      hee = "home-manager edit";
      cmd = "command";
      doo = "doas";
      del = "doas rm -rf";
      zzz = "systemctl suspend";
      bat = "bat --style plain -P --theme base16";
      use = "xrdb merge";
      load = "kill -USR1 $(pidof st)";
      tree = "exa --icons -s type -T --git";
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

      function run() {
        nix run nixpkgs#$@
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
