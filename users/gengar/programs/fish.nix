{ config, pkgs, ... }:

{
  programs.fish = {
    enable = true;
    shellInit = ''
      if status is-interactive
          # Commands to run in interactive sessions can go here
      end

      set -l foreground ebdbb2
      set -l selection 364A82
      set -l comment 928374
      set -l red cc241d
      set -l orange d65d0e
      set -l yellow d79921
      set -l green b8bb26
      set -l purple b16286
      set -l cyan 83a598
      set -l pink b16286
      set -g fish_color_normal $foreground
      set -g fish_color_command $green
      set -g fish_color_keyword $pink
      set -g fish_color_quote $yellow
      set -g fish_color_redirection $foreground
      set -g fish_color_end $orange
      set -g fish_color_error $red
      set -g fish_color_param $foreground
      set -g fish_color_comment $comment
      set -g fish_color_selection --background=$selection
      set -g fish_color_search_match --background=$selection
      set -g fish_color_operator $green
      set -g fish_color_escape $pink
      set -g fish_color_autosuggestion $comment
      set -g fish_pager_color_progress $comment
      set -g fish_pager_color_prefix $cyan
      set -g fish_pager_color_completion $foreground
      set -g fish_pager_color_description $comment
      
      export VISUAl='emacsclient -nc' 
      export EDITOR='nvim'
      export NNN_PLUG='c:fzcd;l:launch;z:autojump;p:preview-tui;P:preview-tabbed;o:fzopen;'
      export LC_CTYPE=pt_BR.UTF-8
      export GOPATH="$XDG_DATA_HOME"/go
      export ZDOTDIR=$HOME/.config/zsh
      export PATH="$HOME/.local/bin:$PATH"
      export XDG_CONFIG_HOME=$HOME/.config
      export XDG_CACHE_HOME=$HOME/.cache
      export XDG_DATA_HOME=$HOME/.local/share
      export CARGO_HOME="$XDG_DATA_HOME"/cargo
      export GTK_RC_FILES="$XDG_CONFIG_HOME"/gtk-1.0/gtkrc
      export GTK2_RC_FILES="$XDG_CONFIG_HOME"/gtk-2.0/gtkrc
      export _Z_DATA="$XDG_DATA_HOME/z"
      export LESSKEY="$XDG_CONFIG_HOME"/less/lesskey
      export LESSHISTFILE="$XDG_CACHE_HOME"/less/history
      export ZDOTDIR=$HOME/.config/zsh
      export ANDROID_SDK_HOME="$XDG_CONFIG_HOME"/android
      export HISTFILE="$XDG_DATA_HOME"/zsh/history
      export WGETRC="$XDG_CONFIG_HOME/wgetrc"
      export PATH="$HOME/.local/bin:$PATH"
      export TMUX_TMPDIR="$XDG_RUNTIME_DIR"
      export XINITRC="$XDG_CONFIG_HOME"/X11/xinitrc
      export NPM_CONFIG_USERCONFIG=$XDG_CONFIG_HOME/npm/npmrc
      export GNUPGHOME="$XDG_DATA_HOME"/gnupg
      export RUSTUP_HOME="$XDG_DATA_HOME"/rustup
      export GEM_HOME="$XDG_DATA_HOME"/gem
      export GEM_SPEC_CACHE="$XDG_CACHE_HOME"/gem
      export GNUPGHOME="$XDG_DATA_HOME"/gnupg
      export TERMINFO="$XDG_DATA_HOME"/terminfo
      export TERMINFO_DIRS="$XDG_DATA_HOME"/terminfo:/usr/share/terminfo
      export NODE_REPL_HISTORY="$XDG_DATA_HOME"/node_repl_history
      export PASSWORD_STORE_DIR="$XDG_DATA_HOME"/pass
      export SPACEMACSDIR="$XDG_CONFIG_HOME"/spacemacs.d
      export PATH="$GOPATH/bin:$PATH"
      export PATH="$HOME/.local/bin:$PATH"
      export PATH="$CARGO_HOME/bin:$PATH"
      export PATH="$GEM_HOME/ruby/3.0.0/bin:$PATH"
      export PATH="$XDG_CONFIG_HOME/Doom/bin:$PATH"
      export PATH="$XDG_DATA_HOME/npm/bin:$PATH"
      export NOTMUCH_CONFIG="$XDG_CONFIG_HOME"/notmuch/notmuchrc
      export NMBGIT="$XDG_DATA_HOME"/notmuch/nmbug
      export JDTLS_HOME="$XDG_DATA_HOME"/jdtls
      export ASDF_DATA_DIR="$XDG_DATA_HOME/asdf"
      export ASDF_CONFIG_FILE="$XDG_CONFIG_HOME:/asdf/asdfrc"
      export FZF_DEFAULT_COMMAND='fd -H -t f'
      export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS'
        --color fg:#ebdbb2,hl:#fabd2f,fg+:#ebdbb2,bg+:#3c3836,hl+:#fabd2f
        --color info:#83a598,prompt:#bdae93,spinner:#fabd2f,pointer:#83a598,marker:#fe8019,header:#665c54'
      export WLR_NO_HARDWARE_CURSORS=1
      
      xset r rate 320 40
      set -U fish_greeting 
      
      function fish_user_key_bindings
        if command -s fzf-share >/dev/null
          source (fzf-share)/key-bindings.fish
        end
      
        fzf_key_bindings
        bind -M insert \cl forward-word
      end
      
    '';
    shellAbbrs = {
      c = "clear;";
      g = "git";
    };
    shellAliases = {
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
    plugins = [
      {
        name = "autopair";
        src = pkgs.fetchFromGitHub {
          owner = "jorgebucaran";
          repo = "autopair.fish";
          rev = "1222311994a0730e53d8e922a759eeda815fcb62";
          sha256 = "l6WJ2kjDO/TnU9FSigjxk5xFp90xl68gDfggkE/wrlM=";
        };
      }

      {
        name = "licenses";
        src = pkgs.fetchFromGitHub {
          owner = "oh-my-fish";
          repo = "plugin-license";
          rev = "0155b16f102957ec0c734a90979245dc1073f979";
          sha256 = "Bi9Q5rekZoyXYbRV+U4SmwCdqCl0pFupzm5si7SxFns=";
        };
      }
    ];
  };
}

