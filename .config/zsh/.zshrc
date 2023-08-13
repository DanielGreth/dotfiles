# Lines configured by zsh-newuser-install
bindkey -v
# End of lines configured by zsh-newuser-install

autoload -Uz vcs_info							# remove at some point
precmd() { vcs_info }							#
zstyle ':vcs_info:git:*' formats '%b '					#
setopt PROMPT_SUBST							#
PROMPT='%F{green}%*%f %F{blue}%~%f %F{red}${vcs_info_msg_0_}%f$ '	#

#(cat ~/.cache/wal/sequences &) # Applying the theme to new terminals from pywal github


# The following lines makes sure that the keys do the correct thing (my delete key did not work in zsh prior to this)
# and inputrc file does not work for zsh 
autoload zkbd
source ~/.config/zsh/.zkbd/$TERM-${${DISPLAY:t}:-$VENDOR-$OSTYPE}
[[ -n ${key[Backspace]} ]]     && bindkey "${key[Backspace]}"     backward-delete-char
[[ -n ${key[Insert]} ]]        && bindkey "${key[Insert]}"        overwrite-mode
[[ -n ${key[Home]} ]]          && bindkey "${key[Home]}"          beginning-of-line
[[ -n ${key[PageUp]} ]]        && bindkey "${key[PageUp]}"        up-line-or-history
[[ -n ${key[Delete]} ]]        && bindkey "${key[Delete]}"        delete-char
[[ -n ${key[End]} ]]           && bindkey "${key[End]}"           end-of-line
[[ -n ${key[PageDown]} ]]      && bindkey "${key[PageDown]}"      down-line-or-history
[[ -n ${key[Up]} ]]            && bindkey "${key[Up]}"            up-line-or-search
[[ -n ${key[Left]} ]]          && bindkey "${key[Left]}"          backward-char
[[ -n ${key[Down]} ]]          && bindkey "${key[Down]}"          down-line-or-search
[[ -n ${key[Right]} ]]         && bindkey "${key[Right]}"         forward-char
[[ -n ${key[Control-Left]} ]]  && bindkey "${key[Control-Left]}"  backward-word
[[ -n ${key[Control-Right]} ]] && bindkey "${key[Control-Right]}" forward-word


# Alias: not sure why but seems to not work when set in .zprofile
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias ip='ip -color=auto'

# If not running interactively, don't do anything
[[ $- =~ i ]] || return

## Plugins
	function zsh_load_plugins() {
		local plugin
		for plugin ($@); do
			if [ -r "${ZDOTDIR:-$XDG_CONFIG_HOME/zsh}/plugins/$plugin/$plugin.zsh" ]; then
				source "${ZDOTDIR:-$XDG_CONFIG_HOME/zsh}/plugins/$plugin/$plugin.zsh" 2>/dev/null
			elif [ -r "${ZDOTDIR:-$XDG_CONFIG_HOME/zsh}/plugins/$plugin/$plugin.plugin.zsh" ]; then
				source "${ZDOTDIR:-$XDG_CONFIG_HOME/zsh}/plugins/$plugin/$plugin.plugin.zsh" 2>/dev/null
			elif [ -r "${ZDOTDIR:-$XDG_CONFIG_HOME/zsh}/plugins/$plugin/$plugin.zsh-theme" ]; then 
				source "${ZDOTDIR:-$XDG_CONFIG_HOME/zsh}/plugins/$plugin/$plugin.zsh-theme" 2>/dev/null
			else
				echo "$funcstack[1]: Unable to load '$plugin'." >&2
			fi
		done
	}
	function zsh_update_plugins() {
		local plugin
		for plugin (${ZDOTDIR:-$XDG_CONFIG_HOME/zsh}/plugins/*(N/)); do
			git -C "$plugin" rev-parse --is-inside-work-tree >/dev/null 2>&1 || continue
			printf '%s: ' "$plugin:t"
			git -C "$plugin" remote -v | grep -q upstream && { git -C "$plugin" fetch upstream || printf '%s: Could not fetch upstream... \n' "$plugin:t" }
			git -C "$plugin" pull 2>/dev/null || echo "Unable to upgrade."
		done
	}
	plugins=(
		#costom_completions
		init
		completions
		history
		#jq.plugin
		#lf
		#xplr
		#utils
		#vi_mode
		fzf
		#fast-syntax-highlighting
	)
	zsh_load_plugins $plugins

