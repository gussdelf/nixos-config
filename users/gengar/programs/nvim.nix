{ config, pkgs, ... }:

{
  programs.neovim = {
    enable = true;
    package = pkgs.neovim-nightly;
    extraConfig = ''
      luafile ${../config/neovim/init.lua}
    '';
  };
}
