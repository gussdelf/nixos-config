{ config, pkgs, ... }:

{
  programs.helix = {
    enable = true;
    settings = {
      theme = "base16_default_dark";
      editor = {
        line-number = "relative";
        true-color = true;
        mouse = false;
        cursor-shape = {
          insert = "block";
          normal = "block";
          select = "underline";
        };
        file-picker = { hidden = false; };
      };
    };
    languages = [
      {
        name = "nix";
        auto-format = true;
      }
      {
        name = "rust";
        auto-format = true;
      }
      {
        name = "c";
        auto-format = true;
      }
      {
        name = "cpp";
        auto-format = true;
      }
    ];
  };
}
