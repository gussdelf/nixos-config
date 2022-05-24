{ config, pkgs, nixpkgs, overlays, ... }: {
  home = {
    packages = with pkgs; [
      shfmt
      shellcheck

      st-guss
      dmenu-guss
    ];
  };
}
