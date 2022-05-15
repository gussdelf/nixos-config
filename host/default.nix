{ config, nixpkgs, overlays, inputs, ... }:

nixpkgs.lib.nixosSystem rec {
  system = "x86_64-linux";

  modules = [ { nixpkgs = { inherit config overlays; }; } ./configuration.nix ];

  specialArgs = { };
}
