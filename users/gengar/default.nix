{ config, nixpkgs, home, overlays, inputs }:

home.lib.homeManagerConfiguration rec {

  pkgs = import inputs.nixpkgs {
    system = "x86_64-linux";
    inherit overlays config;
  };

  modules = [
    ./home.nix
    {
      home = {
        username = "gengar";
        homeDirectory = "/home/gengar";
        stateVersion = "22.05";
      };
    }
  ];

}
