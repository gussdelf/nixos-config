{ config, pkgs, ... }: {
  programs = {
    fzf = {
      enable = true;
      enableFishIntegration = true;
      enableZshIntegration = true;
      defaultCommand = "fd -H -t f";
      defaultOptions = [
        " --color fg:#D8DEE9,hl:#A3BE8C,fg+:#D8DEE9,bg+:#434C5E,hl+:#A3BE8C \n    --color pointer:#BF616A,info:#4C566A,spinner:#4C566A,header:#4C566A,prompt:#81A1C1,marker:#EBCB8B"
      ];
    };
  };
}
