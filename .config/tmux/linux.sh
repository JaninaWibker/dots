## Clipboard integration
# ctrl+shift+c to send to clipboard
bind y run "tmux save-buffer - | xclip -i -sel clipboard"
# ctrl+shift+v to paste from clipboard
bind p run "tmux set-buffer \"$(xclip -o -sel clipboard)\"; tmux paste-buffer"

bind -T copy-mode 'h' send -X cursor-left
bind -T copy-mode 'j' send -X cursor-down
bind -T copy-mode 'k' send -X cursor-up
bind -T copy-mode 'l' send -X cursor-right

bind -T copy-mode 'Enter' send -X copy-selection-and-cancel\; run "tmux save-buffer - | xclip -i -sel clipboard > /dev/null"
#bind -T copy-mode 'Escape' send -X clear-selection

# Selection with mouse should copy to clipboard right away, in addition to the default action.
unbind -n -T copy-mode MouseDragEnd1Pane
bind -T copy-mode MouseDragEnd1Pane send -X copy-selection-and-cancel\; run "tmux save-buffer - | xclip -i -sel clipboard > /dev/null"

unbind -n -T copy-mode DoubleClick1Pane
unbind -n -T copy-mode TripleClick1Pane

# Double LMB Select & Copy (Word)
bind-key -T copy-mode DoubleClick1Pane \
    select-pane \; \
    send-keys -X select-word \; \
    send-keys -X copy-pipe "xclip -i -sel clip"
 
bind-key -n DoubleClick1Pane \
    select-pane \; \
    copy-mode -M \; \
    send-keys -X select-word \; \
    send-keys -X copy-pipe "tmux save-buffer - | xclip -i -sel clipboard > /dev/null && sleep 0.35s && tmux send-keys -X cancel"

# Triple LMB Select & Copy (Line)
bind-key -T copy-mode TripleClick1Pane \
  select-pane \; \
  send-keys -X select-line \; \
  send-keys -X copy-pipe "xclip -i -sel clip"

bind-key -n TripleClick1Pane \
    select-pane \; \
    copy-mode -M \; \
    send-keys -X select-line \; \
    send-keys -X copy-pipe "tmux save-buffer - | xclip -i -sel clipboard > /dev/null && sleep 0.35s && tmux send-keys -X cancel"

bind-key -T copy-mode 'v' send -X begin-selection
bind-key -T copy-mode 'y' send -X copy-selection-and-cancel

set -g set-clipboard on