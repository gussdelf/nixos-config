{ config, pkgs, overlays, ... }: {
  #home.file.".config/emacs".source = ../config/emacs;
  ".config/doom".source = ./config/doom;
  programs.emacs = {
    enable = true;
    package = pkgs.emacsNativeComp;
    extraPackages = epkgs: [
      epkgs.nix-mode
      epkgs.magit
      epkgs.doom-themes
      epkgs.doom-modeline
      epkgs.evil
      epkgs.evil-org
      epkgs.evil-surround
      epkgs.evil-collection
      epkgs.evil-nerd-commenter
    ];
  };
}
