{ config, pkgs, nixpkgs, overlays, ... }: {
  home = {
    packages = with pkgs; [
      catgirl
      tdesktop
      brave

      nodePackages.bash-language-server
      nodePackages.typescript-language-server
      nodePackages.vim-language-server
      nodePackages.pyright
      rust-analyzer
      sumneko-lua-language-server
      rnix-lsp

      jq

      shfmt
      shellcheck
      stylua

      yarn
      nodejs
      deno

      cmus
      scrcpy
      ytfzf
      bitwarden
      glow
      picom

      feh
      sxiv
      xclip

      lxappearance
      capitaine-cursors

      st-guss
      dmenu-guss
      polybar
      rofi

      nix-prefetch-github
    ];
  };
}
