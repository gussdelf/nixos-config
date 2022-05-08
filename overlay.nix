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
  neovim-nightly = super.neovim-unwrapped.overrideAttrs (oldAttrs: rec {
    pname = "neovim-nightly";
    version = "master";
    src = builtins.fetchGit {
      url = https://github.com/neovim/neovim.git;
    };

    nativeBuildInputs = super.neovim-unwrapped.nativeBuildInputs
      ++ [ super.tree-sitter ];

  });
})
