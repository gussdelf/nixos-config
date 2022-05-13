{ config, pkgs, ... }: {
  programs = {
    fzf = {
      enable = true;
      enableFishIntegration = true;
      enableZshIntegration = true;
      defaultCommand = "fd -H -t f";
      defaultOptions = [
        " --color fg:#ebdbb2,hl:#fabd2f,fg+:#ebdbb2,bg+:#3c3836,hl+:#fabd2f\n          --color info:#83a598,prompt:#bdae93,spinner:#fabd2f,pointer:#83a598,marker:#fe8019,header:#665c54"
      ];
    };
  };
}
