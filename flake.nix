{
  description = "My config of balacobaco";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    nur.url = "github:nix-community/nur";
    nur.inputs.nixpkgs.follows = "nixpkgs";

    neovim-nightly.url = "github:nix-community/neovim-nightly-overlay";
    neovim-nightly.inputs.nixpkgs.follows = "nixpkgs";

  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs:
    let
      system = "x86_64-linux";

      pkgs = import nixpkgs {
        inherit system;
        config = {
          allowUnfree = true;
          joypixels.acceptLicense = true;
        };
      };

      lib = nixpkgs.lib;
      overlays = with inputs; [ neovim-nightly.overlay ];

    in {
      nixosConfigurations = {
        boo = lib.nixosSystem {
          inherit system;
          modules = [ ./system/configuration.nix ];
        };
      };

      homeManagerConfigurations = {
        gengar = home-manager.lib.homeManagerConfiguration {
          inherit system pkgs;
          username = "gengar";
          homeDirectory = "/home/gengar";
          configuration = { imports = [ ./user/gengar/home.nix ]; };
        };
      };
    };
}
