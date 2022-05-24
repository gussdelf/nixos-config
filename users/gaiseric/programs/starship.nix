{ config, pkgs, lib, ... }: {
  programs.starship = {
    enable = true;
    enableZshIntegration = true;
    enableFishIntegration = true;
    settings = {
      add_newline = false;
      format = lib.concatStrings [ "$character" "$all" ];
      character = {
        success_symbol = "[λ ](purple)";
        error_symbol = "[λ ](red)";
        vicmd_symbol = "[λ ](green)";
      };
      directory = {
        read_only = " ";
        style = "blue bold";
        truncation_length = 2;
        truncation_symbol = "…/";
      };
    };
  };
}
