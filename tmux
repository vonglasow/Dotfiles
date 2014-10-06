# Mouse
setw        -g  mode-mouse on
set         -g  mouse-select-pane on
set         -g  mouse-resize-pane on
set         -g  mouse-select-window on

setw        -g  aggressive-resize on
bind-key    r   source-file ~/.tmux.conf \; \
                display-message 'Config reloaded!'
