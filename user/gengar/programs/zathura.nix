{ config, pkgs, ... }: {
  programs.zathura = {
    enable = true;

    options = {

      window-title-basename = true;
      statusbar-home-tilde = true;
      recolor = true;
      selection-clipboard = "clipboard";
      statusbar-h-padding = 0;
      statusbar-v-padding = 0;
      show-scrollbars = false;

      notification-error-bg = "#1d2021"; # bg0
      notification-error-fg = "#ea6962"; # red
      notification-warning-bg = "#1d2021"; # bg0
      notification-warning-fg = "#d8a657"; # yellow
      notification-bg = "#1d2021"; # bg0
      notification-fg = "#a9b665"; # green

      completion-bg = "#1d2021"; # bg2
      completion-fg = "#d4be98"; # fg0
      completion-group-bg = "#1d2021"; # bg1
      completion-group-fg = "#928374"; # gray
      completion-highlight-bg = "#7daea3"; # blue
      completion-highlight-fg = "#3c3836"; # bg2

      # Define color in index mode
      index-bg = "#1d2021"; # bg2
      index-fg = "#d4be98"; # fg0
      index-active-bg = "#7daea3"; # blue
      index-active-fg = "#3c3836"; # bg2

      inputbar-bg = "#1d2021"; # bg2
      inputbar-fg = "#d4be98"; # fg0

      statusbar-bg = "#1d2021"; # bg2
      statusbar-fg = "#d4be98"; # fg0

      highlight-color = "#d8a657"; # yellow
      highlight-active-color = "#e78a4e"; # orange

      default-bg = "#1d2021"; # bg3
      default-fg = "#ddc7a1"; # fg1
      render-loading = true;
      render-loading-bg = "#1d2021"; # bg0
      render-loading-fg = "#d4be98"; # fg0

      # Recolor book content's color
      recolor-lightcolor = "#1d2021"; # bg0
      recolor-darkcolor = "#d4be98"; # fg0
      recolor = true;
      recolor-keephue = true; # keep original color

    };
  };
}
