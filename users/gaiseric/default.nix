{ config, nixpkgs, home, overlays, inputs }:

home.lib.homeManagerConfiguration rec {
  system = "x86_64-linux";
  username = "gaiseric";
  homeDirectory = "/home/${username}";

  pkgs = import inputs.nixpkgs {
    system = "x86_64-linux";
    inherit overlays config;
  };

  configuration.imports = [ ./home.nix ];

  extraSpecialArgs = { };

  stateVersion = "22.11";
}
