## History file configuration
	HISTFILE="$XDG_DATA_HOME/zsh/history"
	HISTSIZE=12800
	SAVEHIST=$((HISTSIZE/2))	
## History command configuration
	setopt appendhistory
	setopt share_history
	setopt incappendhistory		# Immediately append to history file, not just when a term i killed
	setopt hist_expire_dups_first	# Delete duplicates first when HISTFILE size exceeds HISTSIZE
	setopt hist_find_no_dups	# If duplicate lines have been saved, still show then only once
	setopt hist_ignore_dups		# Ignore duplicated commands history lists
	setopt hist_ignore_space	# Ignore commands that start with space
	setopt hist_reduce_blanks	# Remove extra blanks from each command line being added to history

