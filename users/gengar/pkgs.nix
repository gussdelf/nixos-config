{ config, pkgs, nixpkgs, overlays, ... }: {
  home = {
    packages = with pkgs; [
      catgirl

      nodePackages.bash-language-server
      nodePackages.typescript-language-server
      nodePackages.vim-language-server
      nodePackages.pyright
      sumneko-lua-language-server
      rnix-lsp
     
      shfmt
      shellcheck
      stylua

      yarn
      nodejs
      deno

      st-guss
      dmenu-guss
      neovim-nightly
    ];
  };
}
