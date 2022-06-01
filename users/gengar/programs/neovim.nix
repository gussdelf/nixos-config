{ config, pkgs, overlays, ... }:

{
  home.file."${config.home.homeDirectory}/.config/nvim".source = ../config/nvim;
  home = { packages = with pkgs; [ neovim-nightly ]; };
}
