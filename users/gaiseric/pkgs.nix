{ config, pkgs, nixpkgs, overlays, ... }: {
  home = {
    packages = with pkgs; [
      shfmt
      shellcheck

      xclip

      picom
      feh
      sxiv

      lxappearance
      capitaine-cursors

      st-guss
      dmenu-guss

      neovim-nightly
      emacs
    ];
  };
}
