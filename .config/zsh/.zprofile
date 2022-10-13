## Basic settings
	export TERMINAL="st"
	export WN="dwm"
#	export READER="zathura"
#	export OPENER="xdg-open"
	export PAGER="less"
	export EDITOR="vim"
#	export VISUAL="nvim"
	export DIFFTOOL="vimdiff"
#	export BROWSER="firefox"


## XDG Base Directory locations
	export XDG_CONFIG_HOME="$HOME"/.config
	export XDG_DATA_HOME="$HOME"/.local/share
	export XDG_CACHE_HOME="$HOME"/.cache
	export XDG_DATA_DIRS="$XDG_DATA_HOME":/usr/share:/usr/local/share
	export ZDOTDIR="${XDG_CONFIG_HOME:-$HOME/.config}"/zsh
	export HISTFILE="${XDG_DATA_HOME:-$HOME/.local/share}"/zsh/history	# Historyfile for zsh
	export LESSHISTFILE=-							# no history file for less
	export XAUTHORITY="$XDG_RUNTIME_DIR"/Xauthority				# used by x
	export XINITRC="$XDG_CONFIG_HOME"/X11/xinitrc				# xinit for DWM
	export XSERVERRC="$XDG_CONFIG_HOME"/X11/xserverrc			# xinit for DWM
	export DRI_PRIME=1							# Switch to AMD GPU instead of integrated intel
	export CARGO_HOME="$XDG_DATA_HOME"/cargo				# Rust's package manager
	export RUSTUP_HOME="$XDG_DATA_HOME"/rustup				# Rust's toolchain manager

# Start graphical server on tty1 if not already running
	if [ -z ${DISPLAY} ] && [ "${XDG_VTNR}" -eq 1 ]; then
		startx "$XDG_CONFIG_HOME/X11/xinitrc" -- "$XDG_CONFIG_HOME/X11/xserverrc" vt1
	fi

