{ config, pkgs, ... }:

{
  programs.helix = {
    enable = true;
    settings = {
      theme = "gruvbox";
      editor = {
        line-number = "relative";
        true-color = true;
        mouse = false;
      };
      editor.cursor-shape = {
        insert = "block";
        normal = "block";
        select = "underline";
      };
      editor.file-picker = { hidden = false; };
    };
  };
}
