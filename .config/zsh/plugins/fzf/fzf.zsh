source "/usr/share/fzf/key-bindings.zsh"

# SHIFT-ALT-i - Paste the selected entry from locate output into the command line
fzf-locate-widget() {
   local selected
   if selected=$(locate $(pwd) | fzf +s -q "$LBUFFER"); then
      LBUFFER=$selected
   fi
   zle redisplay
}
zle -N fzf-locate-widget
bindkey '^[I' fzf-locate-widget
