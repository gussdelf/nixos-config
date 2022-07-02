{ config, pkgs, ... }:
let theme = import ../../../theme/theme.nix { };
in
{
  programs = {
    fzf = {
      enable = true;
      enableFishIntegration = true;
      enableZshIntegration = true;
      defaultCommand = "fd -H -t f";
      defaultOptions = [
        " --color fg:#${theme.colors.c06},hl:#${theme.colors.c0A},fg+:#${theme.colors.c06},bg+:#${theme.colors.c01},hl+:#${theme.colors.c0A}\n          --color info:#${theme.colors.c0D},prompt:#${theme.colors.c04},spinner:#${theme.colors.c0A},pointer:#${theme.colors.c0D},marker:#${theme.colors.c09},header:#${theme.colors.c03}"
      ];
    };
  };
}
