{ config, pkgs, ... }: {
  home = {
    packages = with pkgs; [

      nodePackages.bash-language-server
      nodePackages.typescript-language-server
      nodePackages.vim-language-server
      nodePackages.pyright
      sumneko-lua-language-server
      rnix-lsp
      gopls

      shfmt
      stylua
      shellcheck

      editorconfig-core-c

      stow
      neofetch
      picom
      scrcpy

      lxappearance
      capitaine-cursors
      tdesktop

      ytfzf
      cmus

      neovim-nightly

      bitwarden
      yarn
      nodejs
      deno
    ];
  };
}
