## Basic settings
	export TERMINAL="st"
	export WM="dwm"
#	export READER="zathura"
#	export OPENER="xdg-open"
	export PAGER="less"
	export EDITOR="nvim"
	export VISUAL="nvim"
	export DIFFTOOL="nvim -d"
	export BROWSER="firefox"
   export DO_NOT_TRACK=1 # respected by docker and other apps


## XDG Base Directory locations
	export XDG_CONFIG_HOME="$HOME"/.config
	export XDG_DATA_HOME="$HOME"/.local/share
	export XDG_CACHE_HOME="$HOME"/.cache
	export XDG_DATA_DIRS="$XDG_DATA_HOME":/usr/share:/usr/local/share
	export INPUTRC="${XDG_CONFIG_HOME:-$HOME/.config}"/readline/inputrc
	export ZDOTDIR="${XDG_CONFIG_HOME:-$HOME/.config}"/zsh
	export HISTFILE="${XDG_DATA_HOME:-$HOME/.local/share}"/zsh/history	# Historyfile for zsh
	export LESSHISTFILE=-							# no history file for less
	export XAUTHORITY="$XDG_DATA_HOME"/sx/xauthfile
	export XINITRC="$XDG_CONFIG_HOME"/X11/xinitrc				# xinit for DWM
	export XSERVERRC="$XDG_CONFIG_HOME"/X11/xserverrc			# xinit for DWM
	export DRI_PRIME=1							# Switch to AMD GPU instead of integrated intel
	export CARGO_HOME="$XDG_DATA_HOME"/cargo				# Rust's package manager
	export RUSTUP_HOME="$XDG_DATA_HOME"/rustup				# Rust's toolchain manager
   export NPM_CONFIG_USERCONFIG="${XDG_CONFIG_HOME:-$HOME/.config}"/npm/npmrc       # Node package manager

   export DOCKER_CONFIG="$XDG_CONFIG_HOME"/docker
   export VAGRANT_HOME="$XDG_DATA_HOME"/vagrant
   export VAGRANT_ALIAS_FILE="$XDG_DATA_HOME"/vagrant/aliases
   export ANSIBLE_HOME="${XDG_CONFIG_HOME}/ansible"
   export ANSIBLE_CONFIG="${XDG_CONFIG_HOME}/ansible.cfg"
   export ANSIBLE_GALAXY_CACHE_DIR="${XDG_CACHE_HOME}/ansible/galaxy_cache"

# fzf options
   export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
   export FZF_DEFAULT_OPTS="--cycle --layout=reverse --height 50% --border --color fg:#ebdbb2,hl:#d79921,fg+:#83a598,bg+:#3c3836,hl+:#fabd2f,info:#d3869b,prompt:#add8e6,spinner:#8ec07c,pointer:#83a598,marker:#98971a,header:#a89984" # TODO play with colors
   export FZF_CTRL_T_OPTS="--select-1 --exit-0 --preview '(highlight -O ansi -l {} 2> /dev/null || cat {} || tree -C {}) 2> /dev/null | head -200'"
   export FZF_CTRL_T_COMMAND='rg --files --no-ignore --hidden --follow --glob "!.git/*" --glob "!node_modules/*" --glob "!.cache/" --glob "!.mozilla/" 2> /dev/null'
   export FZF_ALT_C_OPTS="--exact --select-1 --exit-0 --preview 'tree -C {} | head -200'" # this is almost a file manager
   export FZF_ALT_C_COMMAND="fd --type directory --hidden --follow --exclude .git"
   export FZF_CTRL_R_OPTS="--preview 'echo {}' --preview-window down:3:hidden:wrap --bind 'F1:toggle-preview' --bind 'ctrl-y:execute-silent(echo -n {2..} | xclip -i -sel clip)+abort'"


## Appearance
   export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;36:locus=01:quote=01'
   [ -f ${XDG_CONFIG_HOME:-$HOME/.config}/dircolors/dircolors.dark ] && eval `dircolors -b ${XDG_CONFIG_HOME:-$HOME/.config}/dircolors/dircolors.dark`
   export GREP_COLORS='mt=1;92;40'
# Anto aliasing in the two toolkits
   export GDK_USE_XFT=1
   export QT_XFT=true
# Consistent theming for Qt5
   export QT_QPA_PLATFORMTHEME=qt5ct
# Less, man, ls and grep colors
   export MANROFFOPT="-P -c"
   export LESS='-R --use-color -Dd+r$Du+b$'
   export MANPAGER="less -R --use-color -Dd+r -Du+b"


if [ "$TERM" = "linux" ]; then
	# gruvbox in TTY ;)
	echo -en "\e]P0282828"
	echo -en "\e]P1CC241D"
	echo -en "\e]P298971A"
	echo -en "\e]P3D79921"
	echo -en "\e]P4458588"
	echo -en "\e]P5B16286"
	echo -en "\e]P6689D6A"
	echo -en "\e]P7A89984"
	echo -en "\e]P8928374"
	echo -en "\e]P9FB4934"
	echo -en "\e]PAB8BB26"
	echo -en "\e]PBFABD2F"
	echo -en "\e]PC83A598"
	echo -en "\e]PDD3869B"
	echo -en "\e]PE8EC07C"
	echo -en "\e]PFEBDBB2"
	clear # fix some weird artifacting
fi


# Start graphical server on tty1 if not already running
	if [ -z ${DISPLAY} ] && [ "${XDG_VTNR}" -eq 1 ]; then
		exec sx 2>/dev/null
	fi
