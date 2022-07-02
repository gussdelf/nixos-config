{ config, pkgs, lib, ... }: {
  programs.starship = {
    enable = true;
    enableZshIntegration = true;
    enableFishIntegration = true;
    settings = {
      add_newline = false;
      format =
        lib.concatStrings [ "$character" "[|](bold bright-black) " "$all" ];
      character = {
        success_symbol = "[Δ](purple)";
        error_symbol = "[Δ](red)";
        vicmd_symbol = "[Δ](green)";
      };
      directory = {
        read_only = " ";
        style = "blue bold";
        truncation_length = 2;
        truncation_symbol = "…/";
        disabled = true;
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
