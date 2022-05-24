{ config, pkgs, ... }:

{
  programs = {

    git = {
      enable = true;
      userName = "Gustavo Freitas";
      userEmail = "gussdelf@gmail.com";
      aliases = {
        st = "status";
        ps = "!git push origin $(git rev-parse --abbrev-ref HEAD)";
        pl = "!git pull origin $(git rev-parse --abbrev-ref HEAD)";
        lg = "log --all --oneline --graph";
      };
      extraConfig = {
        init.defaultBranch = "main";
        core.editor = "nvim";
      };
    };

    gh = {
      enable = true;
      enableGitCredentialHelper = true;
    };

    lazygit = {
      enable = true;
      settings = { gui.theme = { lightTheme = false; }; };
    };

  };
}
