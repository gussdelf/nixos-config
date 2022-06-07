{ config, pkgs, overlays, ... }: {
  #home.file.".config/emacs".source = ../config/emacs;
  home.file.".config/doom".source = ../config/doom;
  programs.emacs = {
    enable = true;
    package = pkgs.emacsNativeComp;
    extraPackages = epkgs: [ epkgs.nix-mode epkgs.use-package ];
  };
}
