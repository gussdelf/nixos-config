{ config, pkgs, ... }: {
  programs.nnn = {
    enable = true;
    bookmarks = {
      f = "~/Files";
      d = "~/Docs";
      n = "/etc/nixos";
    };
    package = pkgs.nnn.override ({ withNerdIcons = true; });
  };
}
