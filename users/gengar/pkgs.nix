{ config, pkgs, nixpkgs, overlays, ... }: {
  nixpkgs.overlays = [
    (self: super: {
      st-guss = super.st.overrideAttrs (oldAttrs: {
        pname = "st-guss";
        version = "0.0.1";
        src = fetchTarball {
          url = "https://github.com/gussdelf/st/archive/main.tar.gz";
        };
        buildInputs = oldAttrs.buildInputs ++ (with super; [ harfbuzz ]);
      });
      dmenu-guss = super.dmenu.overrideAttrs (oldAttrs: {
        pname = "dmenu-guss";
        version = "0.0.1";
        src = fetchTarball {
          url = "https://github.com/gussdelf/dmenu/archive/master.tar.gz";
        };
        buildInputs = oldAttrs.buildInputs ++ (with super; [ harfbuzz ]);
      });
    })
  ];
  home = {
    packages = with pkgs; [
      catgirl

      nodePackages.bash-language-server
      nodePackages.typescript-language-server
      nodePackages.vim-language-server
      nodePackages.pyright
      sumneko-lua-language-server
      rnix-lsp

      shfmt
      shellcheck
      stylua

      yarn
      nodejs
      deno

      cmus
      scrcpy
      ytfzf
      tdesktop
      bitwarden
      glow

      lxappearance
      capitaine-cursors

      st-guss
      dmenu-guss
      rofi

      neovim-nightly
      helix

    ];
  };
}
