{ config, pkgs, nixpkgs, overlays, ... }: {
  home = {
    packages = with pkgs; [
      catgirl
      tdesktop

      brave
      ungoogled-chromium
      librewolf

      nodePackages.bash-language-server
      nodePackages.typescript-language-server
      nodePackages.vim-language-server
      nodePackages.pyright
      sumneko-lua-language-server
      rust-analyzer
      gopls
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
      flameshot

      feh
      sxiv
      xclip

      lxappearance
      capitaine-cursors

      st-guss
      dmenu-guss
      polybar
      rofi

      duckstation
      mupen64plus
      zsnes

      obsidian
    ];
  };
}
