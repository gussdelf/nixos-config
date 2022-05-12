{ config, pkgs, ... }: {
  home = {
    packages = with pkgs; [
      nodePackages.bash-language-server
      nodePackages.typescript-language-server
      nodePackages.vim-language-server
      nodePackages.pyright
      rnix-lsp

      yarn
      nodejs
      deno
    ];
  };
}
