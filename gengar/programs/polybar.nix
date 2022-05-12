{ config, pkgs, ... }: {
  services.polybar = {
    enable = true;
    config = {
      foreground = "\${xrdb:foreground}";
      background = "\${xrdb:background}";
      color0 = "\${xrdb:color0}";
      color1 = "\${xrdb:color1}";
      color2 = "\${xrdb:color2}";
      color3 = "\${xrdb:color3}";
      color4 = "\${xrdb:color4}";
      color5 = "\${xrdb:color5}";
      color6 = "\${xrdb:color6}";
      color7 = "\${xrdb:color7}";
      color8 = "\${xrdb:color8}";
      color9 = "\${xrdb:color9}";
      color10 = "\${xrdb:color10}";
      color11 = "\${xrdb:color11}";
      color12 = "\${xrdb:color12}";
      color13 = "\${xrdb:color13}";
      color14 = "\${xrdb:color14}";
      color15 = "\${xrdb:color15}";
      color16 = "\${xrdb:color16}";
      color17 = "\${xrdb:color17}";
      color18 = "\${xrdb:color18}";
      color19 = "\${xrdb:color19}";
      color20 = "\${xrdb:color20}";
      color21 = "\${xrdb:color21}";

      "bar/main" = {
        tray-position = "right";
        width = "100%";
        height = "20";
        padding-left = 1;
        padding-right = 0;
        background = "\${colors.background}";
        foreground = "\${colors.foreground}";
        bottom = false;
        border-top-size = 1;
        border-bottom-size = 0;
        border-top-color = "\${colors.background}";
        border-bottom-color = "\${colors.background}";
        line-size = 3;
        wm-restack = "bspwm";

        modules-left = "empty-space bspwm round-right empty-space";
        modules-center = "title";
        modules-right = "launcher pulseaudio cpu mem time zzz";

        font-0 = "JetBrainsMono Nerd Font:style=Bold:pixelsize=10";
        font-1 = "Material Design Icons:style=Bold:size=10";
        font-2 = "unifont:size=9:antialias=true";
        font-3 = "FontAwesome:size=9:antialias=true";

        cursor-click = "pointer";
        cursor-scroll = "ns-resize";
      };

      "module/bspwm" = {
        type = "internal/bspwm";

        pin-workspaces = true;
        enable-click = true;
        enable-scroll = true;
        format-padding = 0;

        ws-icon-0 = "I;α";
        ws-icon-1 = "II;β";
        ws-icon-2 = "III;γ";
        ws-icon-3 = "IV;δ";
        ws-icon-4 = "V;ε";

        format = "<label-state> <label-mode>";
        format-background = "\${colors.background}";
        label-active = "%name%";
        label-occupied = "%name%";
        label-empty = "%name%";

        label-occupied-padding = 1;
        label-empty-padding = 1;
        label-urgent-padding = 1;
        label-active-padding = 1;

        label-urgent = "%name%";
        label-urgent-underline = "\${colors.color16}";
        label-urgent-foreground = "\${colors.color16}";

        label-active-foreground = "\${colors.color1}";
        label-active-underline = "\${colors.color1}";

        label-occupied-foreground = "\${colors.color20}";
        label-empty-foreground = "\${colors.color0}";
      };

      "module/launcher" = {
        type = "custom/text";
        click-left = "rofi -show drun";
        click-right = "rofi -show run";
        click-middle = "rofi -show window";
        content = "%{T2} %{T-}";
        content-background = "\${colors.grey-9}";
        content-foreground = "\${colors.cyan-a1}";
        label-padding = 1;
      };

      "module/pulseaudio" = {
        type = "internal/pulseaudio";
        sink = "alsa_output.pci-0000_12_00.3.analog-stereo";
        use-ui-max = true;
        format-volume = "<ramp-volume> <label-volume>";
        label-volume = "墳 %percentage%%";
        label-muted = "🔇 muted";
        label-muted-foreground = "#666";
        ramp-volume-0 = "🔈";
        ramp-volume-1 = "🔉";
        ramp-volume-2 = "🔊";
        label-padding = 1;
        click-right = "pavucontrol";
      };

      "module/time" = {
        type = "internal/date";
        interval = 60;
        format = "<label>";
        format-background = false;
        date = "%{F#888e96}󰥔 %H:%M%{F-}";
        time-alt = "%{F#61afef}󰃭 %a, %d %b%{F-}";
        label = "%date%%time%";
      };

      "module/mem" = {
        type = "custom/script";
        exec =
          "free -m | sed -n 's/^Mem.:\\s\\+[0-9]\\+\\s\\+\\([0-9]\\+\\)\\s.\\+/\\1/p'";
        format = "<label>";
        format-prefix = "﬙";
        label = "%output% MB";
        label-padding = 1;
        format-prefix-foreground = "\${colors.color13}";
      };

      "module/zzz" = {
        type = "custom/text";
        content = "";
        content-padding = 2;
        click-left = "systemctl suspend &";
        content-foreground = "\${colors.color1}";
      };

      "module/cpu" = {
        type = "internal/cpu";
        interval = 2.5;
        format-prefix = " ";
        format = "<label> ";
        label = "CPU %percentage%%";
        format-background = "\${colors.background}";
        format-foreground = "\${colors.color1}";
        label-padding = 1;
      };

      "module/xwindow" = {
        type = "internal/xwindow";
        label = "%title:0:30:...";
      };

      "module/title" = {
        type = "internal/xwindow";
        format = "<label>";
        format-foreground = "\${color.fg-alt}";
        label = "[%title%]";
        label-maxlen = "30 ...";
      };
    };
  };
}
