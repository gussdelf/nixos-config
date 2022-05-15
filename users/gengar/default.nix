{ config, nixpkgs, home, overlays, inputs }:

home.lib.homeManagerConfiguration rec {
  system = "x86_64-linux";
  username = "gengar";
  homeDirectory = "/home/${username}";

  pkgs = import inputs.nixpkgs {
    inherit overlays;
  };

  configuration.imports = [ ./home.nix ];

  extraSpecialArgs = { };

  stateVersion = "22.05";
}
