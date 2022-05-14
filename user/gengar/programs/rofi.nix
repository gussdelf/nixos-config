{ config, pkgs, ... }: {
  programs.rofi = {
    enable = true;
    extraConfig = {
      configuration = {
        modi = "drun";
        lines = 5;
        font = "Iosevka 12";
        show-icons = true;
        icon-theme = "Oranchelo";
        terminal = "st";
        drun-display-format = "{icon} {name}";
        display-drun = "  ";
        location = 0;
        separator-style = "solid";
        disable-history = false;
        hide-scrollbar = true;
      };
      theme = "/dev/null";
      element-icon = {
        background-color = "inherit";
        text-color = "inherit";
      };
      element-text = {
        background-color = "inherit";
        text-color = "inherit";
      };

      "*" = {
        dark-black = "#1d2021";
        bg-col = "#1d2021";
        border-col = "#bdae93";
        selected-col = "#282828";
        blue = "#83a598";
        fg-col = "#ebdbb2";
        fg-col2 = "#d4be98";
        width = 600;
      };

      window = {
        padding = "20 px";
        height = "360 px";
        border = "3 px";
        border-color = "@border-col";
        background-color = "@bg-col";
      };
      mainbox = {
        padding = "5 px";
        border-radius = "13 px";
        background-color = "@bg-col";
      };

      inputbar = {
        children = "[ prompt,entry ]";
        background-color = "@bg-col";
        border-radius = "5 px";
        padding = "2 px";
      };

      prompt = {
        background-color = "@blue";
        padding = "5 px 5 px 0 px";
        text-color = "@bg-col";
        border-radius = "3 px";
      };

      textbox-prompt-colon = {
        expand = false;
        str = ":";
      };

      entry = {
        padding = "6 px";
        text-color = "@fg-col";
        background-color = "@bg-col";
      };

      listview = {
        border = "0 px 0 px 0 px";
        padding = "6 px 0 px 0 px";
        columns = 2;
        background-color = "@bg-col";
      };

      element = {
        padding = "5 px";
        background-color = "@bg-col";
        text-color = "@fg-col";
      };

      element-icon = { size = "25 px"; };

      "element selected" = {
        background-color = "@selected-col";
        text-color = "@fg-col2";
      };

    };
  };
}
