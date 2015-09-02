# Mouse
setw        -g  mode-mouse on
set         -g  mouse-select-pane on
set         -g  mouse-resize-pane on
set         -g  mouse-select-window on

set-option  -g  prefix C-q
unbind-key  C-b
bind-key    C-q send-prefix

set-option  -g  set-clipboard on
#set-option  -g  renumber-windows on
set-option  -g  set-titles on
set-option  -g  status on
set-option  -g  status-keys vi
set-option  -g  status-utf8 on

bind-key    h       split-window -h
bind-key    v       split-window -v
bind-key    up      select-pane -U
bind-key    right   select-pane -R
bind-key    down    select-pane -D
bind-key    left    select-pane -L
bind-key    n       new-window

setw        -g  aggressive-resize off
bind-key    r   source-file ~/.tmux.conf \; \
                display-message 'Config reloaded!'
