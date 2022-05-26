{ config, pkgs, ... }: {
  home.file.".config/emacs".source = ../config/emacs;
  programs.emacs = {
    enable = true;
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
