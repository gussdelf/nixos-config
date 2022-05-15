{
  description = "My flake of balacobaco";

  inputs = {
    unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs.follows = "unstable";

    home.url = "github:nix-community/home-manager";
    home.inputs.nixpkgs.follows = "nixpkgs";

    neovim-nightly.url = "github:nix-community/neovim-nightly-overlay";
    neovim-nightly.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, home, ... }@inputs:
    with nixpkgs.lib;
    let
      config = {
        allowUnfree = true;
        joypixels.acceptLicense = true;
      };

      overlays = with inputs; [ neovim-nightly.overlay ];

    in {
      nixosConfigurations = {
        boo = import ./host { inherit system nixpkgs home inputs config overlays; };
      };

      homeConfigurations = {
        gengar = import ./users/gengar {
          inherit config nixpkgs home overlays inputs;
        };
      };

      boo = self.nixosConfigurations.boo.config.system.build.toplevel;
    };
}
