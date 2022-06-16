{ config, pkgs, overlays, ... }:

{
  home.file."${config.home.homeDirectory}/.config/nvim" = {
    source = ../config/nvim;
    recursive = true;
  };
  home = { packages = with pkgs; [ neovim-nightly ]; };
}
