{ config, pkgs, lib, ... }: {
  programs.starship = {
    enable = true;
    enableZshIntegration = true;
    enableFishIntegration = true;
    settings = {
      add_newline = false;
      format = lib.concatStrings [ "$character" "$all" ];
      character = {
        success_symbol = "[ ](purple)";
        error_symbol = "[ ](red)";
        vicmd_symbol = "[ ](green)";
      };
      directory = {
        read_only = " ";
        style = "blue bold";
        truncation_length = 2;
        truncation_symbol = "…/";
      };
      aws.symbol = "  ";
      conda.symbol = " ";
      dart.symbol = " ";
      docker_context.symbol = " ";
      elixir.symbol = " ";
      elm.symbol = " ";
      golang.symbol = " ";
      java.symbol = " ";
      lua.symbol = " ";
      julia.symbol = " ";
      nim.symbol = " ";
      nix_shell.symbol = " ";
      package.symbol = " ";
      perl.symbol = " ";
      php.symbol = " ";
      python.symbol = " ";
      ruby.symbol = " ";
      rust.symbol = " ";
      scala.symbol = " ";
      shlvl.symbol = " ";
      swift.symbol = "ﯣ ";
    };
  };
}
