{ config, pkgs, ... }: {
  programs.tmux = {
    enable = true;
    extraConfig = ''
      # Some opts
            set -g base-index 1
            setw -g pane-base-index 1
            set -g mouse on
            set -g set-clipboard on
            set -g default-terminal "st-256color"
            set -ga terminal-overrides ",*:Tc" # force truecolors
            set -as terminal-overrides ',*:Smulx=\E[4::%p1%dm'  # undercurl support
            set -as terminal-overrides ',*:Setulc=\E[58::2::%p1%{65536}%/%d::%p1%{256}%/%{255}%&%d::%p1%{255}%&%d%;m'

      # Prefix
            unbind C-a
            set -g prefix C-Space
            bind C-Space send-prefix

      # copy mode
            bind-key -T prefix y copy-mode
            bind-key -T copy-mode-vi 'v' send -X begin-selection

      # keymaps
            bind-key j next-window
            bind-key k previous-window

            bind-key v split-window -h
            bind-key h split-window -v

            bind-key C-l select-pane -R
            bind-key C-h select-pane -L
            bind-key C-k select-pane -U
            bind-key C-j select-pane -D

            TMUX_FZF_LAUNCH_KEY="C-Space"

            set -g mode-style "fg=#a89984,bg=#504945"
            set -g message-style "fg=#a89984,bg=#504945"
            set -g message-command-style "fg=#a89984,bg=#504945"
            set -g pane-border-style "fg=#504945"
            set -g pane-active-border-style "fg=#a89984"
            set -g status "on"
            set -g status-justify "left"
            set -g status-style "none,bg=#3a3735"
            set -g status-left-length "100"
            set -g status-right-length "100"
            set -g status-left-style NONE
            set -g status-right-style NONE


            set -g status-left "#[fg=#282828,bg=#a89984,bold] #S #[fg=#a89984,bg=#504945,nobold,nounderscore,noitalics]#[fg=#a89984,bg=#504945] %R #[fg=#504945,bg=#3a3735,nobold,nounderscore,noitalics]"
            set -g status-right "#[fg=#504945,bg=#3a3735,nobold,nounderscore,noitalics]#[fg=#a89984,bg=#504945] %a #[fg=#a89984,bg=#504945,nobold,nounderscore,noitalics]#[fg=#282828,bg=#a89984,bold] #h "
            setw -g window-status-activity-style "underscore,fg=#AEAFB0,bg=#131A24"
            setw -g window-status-separator ""
            setw -g window-status-style "NONE,fg=#AEAFB0,bg=#131A24"
            setw -g window-status-format "#[fg=#3a3735,bg=#504945,nobold,nounderscore,noitalics]#[fg=#a89984,bg=#504945] #I #W #F #[fg=#504945,bg=#3a3735,nobold,nounderscore,noitalics]"
            setw -g window-status-current-format "#[fg=#3a3735,bg=#a89984,nobold,nounderscore,noitalics]#[fg=#282828,bg=#a89984,bold] #I #W #F #[fg=#a89984,bg=#3a3735,nobold,nounderscore,noitalics]"

            set -g status-justify "centre"


    '';
  };
}
