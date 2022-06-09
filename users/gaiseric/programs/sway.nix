{ config, pkgs, ... }: {
  home.packages = with pkgs; [ waybar ];
  wayland.windowManager.sway = {
    enable = true;
    config = {
      terminal = "st";
      bars = [{ command = "waybar"; }];
    };
  };
}
