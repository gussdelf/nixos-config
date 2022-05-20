{ config, pkgs, ... }: {
  programs.emacs = {
    enable = true;
    extraPackages = epkgs: [
      epkgs.nix-mode
      epkgs.magit
      epkgs.doom-themes
      epkgs.doom-modeline
      epkgs.evil
      epkgs.evil-collection
      epkgs.evil-org
      epkgs.evil-surround
      epkgs.evil-nerd-commenter
    ];
  };
}
