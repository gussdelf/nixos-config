{ config, pkgs, ... }:

{
  XAUTHORITY = "${config.xdg.configHome}/Xauthority";
  RUSTUP_HOME = "${config.xdg.dataHome}/rustup";
  CARGO_HOME = "${config.xdg.dataHome}/cargo";
  GOPATH = "${config.xdg.dataHome}/go";
  VISUAL = "emacsclient -nc";
  EDITOR = "nvim";
  LC_CTYPE = "pt_BR.UTF-8";
  PATH =
    "$HOME/.local/bin:/usr/local/bin:$GOPATH/bin:$HOME/.local/bin:$CARGO_HOME/bin:${config.xdg.dataHome}/npm/bin:$PATH";
  XDG_CONFIG_HOME = "${config.xdg.configHome}";
  XDG_CACHE_HOME = "${config.xdg.configHome}";
  XDG_DATA_HOME = "${config.xdg.dataHome}";
  _Z_DATA = "${config.xdg.dataHome}/z";
  LESSKEY = "${config.xdg.configHome}/less/lesskey";
  LESSHISTFILE = "${config.xdg.cacheHome}/less/history";
  ANDROID_SDK_HOME = "${config.xdg.configHome}/android";
  WGETRC = "${config.xdg.configHome}/wgetrc";
  TMUX_TMPDIR = "$XDG_RUNTIME_DIR";
  XINITRC = "${config.xdg.configHome}/X11/xinitrc";
  NPM_CONFIG_USERCONFIG = "${config.xdg.configHome}/npm/npmrc";
  GEM_HOME = "${config.xdg.dataHome}/gem";
  GEM_SPEC_CACHE = "${config.xdg.cacheHome}/gem";
  GNUPGHOME = "${config.xdg.dataHome}/gnupg";
  TERMINFO = "${config.xdg.dataHome}/terminfo";
  TERMINFO_DIRS = "${config.xdg.dataHome}/terminfo:/usr/share/terminfo";
  NODE_REPL_HISTORY = "${config.xdg.dataHome}/node_repl_history";
  PASSWORD_STORE_DIR = "${config.xdg.dataHome}/pass";
  SPACEMACSDIR = "${config.xdg.configHome}/spacemacs.d";
  NOTMUCH_CONFIG = "${config.xdg.configHome}/notmuch/notmuchrc";
  NMBGIT = "${config.xdg.dataHome}/notmuch/nmbug";
  ASDF_DATA_DIR = "${config.xdg.dataHome}/asdf";
  ASDF_CONFIG_FILE = "${config.xdg.configHome}/config/asdf/asdfrc";
  WLR_NO_HARDWARE_CURSORS = 1;
}
