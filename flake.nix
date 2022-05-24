{
  description = "My flake of balacobaco";

  inputs = {
    unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs.follows = "unstable";

    home.url = "github:nix-community/home-manager";
    home.inputs.nixpkgs.follows = "nixpkgs";

    neovim-nightly.url = "github:nix-community/neovim-nightly-overlay";
    neovim-nightly.inputs.nixpkgs.follows = "nixpkgs";

    nur.url = "github:nix-community/NUR";
  };

  outputs = { self, nixpkgs, home, ... }@inputs:
    with nixpkgs.lib;
    let
      config = {
        allowUnfree = true;
        joypixels.acceptLicense = true;
        pulseaudio = true;
      };

      # THIEF!!!
      filterNixFiles = k: v: v == "regular" && nixpkgs.lib.hasSuffix ".nix" k;

      importNixFiles = path:
        with nixpkgs.lib;
        (lists.forEach (mapAttrsToList (name: _: path + ("/" + name))
          (filterAttrs filterNixFiles (builtins.readDir path)))) import;

      overlays = with inputs;
        [
          (final: _:
            let inherit (final) system;
            in
            {
              neovim-nigthly = neovim.packages."${system}".neovim;
              unstable = import unstable { inherit system config; };
            })
          neovim-nightly.overlay
          nur.overlay
        ] ++ (importNixFiles ./overlays);

    in
    {
      nixosConfigurations = {
        boo = import ./hosts/boo {
          inherit system nixpkgs home inputs config overlays;
        };
      };

      homeConfigurations = {
        gengar = import ./users/gengar {
          inherit config nixpkgs home overlays inputs;
        };

        gaiseric = import ./users/gaiseric {
          inherit config nixpkgs home overlays inputs;
        };
      };

      boo = self.nixosConfigurations.boo.config.system.build.toplevel;
    };
}
