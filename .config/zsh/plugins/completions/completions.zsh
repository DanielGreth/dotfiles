# Initialise
	zmodload zsh/complist

# Speed up completion loading at startup
	zcachedir="$XDG_CACHE_HOME/zsh"
	[[ -d "$zcachedir" ]]  mkdir -p "$zcachedir"

	() {
		setopt local_options extendedglob
		autoload -Uz compinit
		local zcompf="$1/zcompdump"
		# Use a separate file to determine whether to regenerate compdump,
		# compinit doesn't always need to modify the compdump
		local zcompf_a="${zcompf}.augur"

		# Use glob qualifier (#q), to use globs inside [[
		# http://zsh.sourceforge.net/Doc/Release/Expansion.html#Glob-Qualifiers
		# N => NULL_GLOB
		# . => plain files
		# m[Mwhms][-|+]n => modification time qualifiers
		if [[ -e "$zcompf_a" && -f "$zcompf_a" (#qN.mh-24) ]]; then
			compinit -C -u -d "$zcompf" # Skip checking for insecure files/directories (compaudit)
		else
			compinit -u -d "$zcompf"
			touch "$zcompf_a"
		fi

		# Complete .files
		_comp_options+=(globdots)

		# If zcompdump exists, is non-zero and is older than the .zwc, then regenerate
		if [[ -s "$zcompf" && (! -s "${zcompf}.zwc" || "$zcompf" -nt "${zcompf}.zwc") ]]; then
			# Since file is mapped, it might be mapped right nom in current shells, so
			# rename it then make a new one
			[[ -e "$zcompf.zwc" ]] && mv -f "$zcompf.zwc" "$zcompf.zwc.old"
			# Compile with -M so that it's shared between multiple shells
			{ zcompile -M "$zcompf" } &! # Run in background
		fi
	} "$zcachedir"

# Basic autocomplete with: menu-listing, hyphen- and case-insesitivity, 
# accepts abbreviations after . or _ or - (ie. f.b -> foo.bar), 
# substring complete (ie. bar -> foobar), and colored with LS_COLORS
	zstyle ':completion:*:*:*:*:*' menu select
	zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
	zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
# If you end up using a directory as argument, this will remove the trailing slash (useful in ls)
	zstyle ':completion:*' squeeze-slashes true
# Use caching to improve completion for commands related to packages or kernel modules
	zcompcdir="$zcachedir/zcompcache"
	[[ -d "$zcompcdir" ]] || mkdir -p "$zcompcdir"
	zstyle ':completion::complete:*' use-cache on
	zstyle ':completion::complete:*' cache-path "$zcompcdir"
	unset zcompcdir
	unset zcachedir
# Fuzzy match mistyped completions
	zstyle ':completion:*' _expand completer _complete _match _approximate
	zstyle ':completion:*' extra-verbose yes
	zstyle ':completion:*:descriptions' format '%U%B%d%b%u'
	zstyle ':completion:*:messages' format '%d'
	zstyle ':completion:*:warnings' format 'No matches for: %d%b'
	zstyle ':completion:*:corrections' format '%B%d (errors: %e)%b'
	zstyle ':completion:*' group-name '' # Completionin distinct groups
# Allow one error for every four characters typed in approximate completer
	zstyle ':completion:*:match:*' original only
	zstyle -e ':completion:*:approximate:*' max-errors 'reply=( $(( ($#PREFIX+$#SUFFIX)/4 )) numeric)'
# Split options into groups
	zstyle ':completion:*' tag-order \
		'options:-long:long\ options
		 options:-short:short\ options
		 options:-single-letter:single\ letter\ options'
	zstyle ':completion:*:options-long'ignored-patterns '[-+](|-|[^-]*)'
	zstyle ':completion:*:options-short' ignored-patterns '--*' '[-+]?'
	zstyle ':completion:*:options-single-letter' ignored-patterns '???*'
# Insert all expansions for expand completer
	zstyle ':completion:*:expand:*' tag-order all-expansions
# Kill
	zstyle ':completion:*:*:*:*:processes' command 'ps -uf'
	zstyle ':completion:*:*:*:*:processes*' force-list always
	zstyle ':completion:*:processes-name' command "ps -eo cmd= | sed 's:\([^ ]*\).*:\1:;s:\(/[^ ]*/\)::;/^\[/d'"
	zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#) ([0-9a-z-]#)*=01;34=0=01'
	zstyle ':completion:*:*:kill:*' menu yes # Same thing as bellow but for kill processes completion
# History
## When using history-complete-(newer/older), complete with the first item on the first 
## request (as opposed to 'menu select' which only shows the menu on the first request)
## NOTE: this uses Alt+- backward and Alt+, forward to complete the current argument 
## and Alt+. to go through the previous lines' last argument (latter is in bindkeysrc)
	zstyle ':completion:history-words:*' menu yes
	zstyle ':completion:*:history-words' stop yes
	zstyle ':completion:*:history-words' remove-all-dups yes
	zstyle ':completion:*:history-words' list false
	zstyle ':completion:*:*:kill:*' force-list always
	zstyle ':completion:*:*:kill:*' insert-ids single
# Offer completions for directories from all these groups
	zstyle ':completion:*::*:(cd|pushd):*' tag-order local-directories directory-stack path-directories
# Never offer the parent directory (e.g.: cd ../<TAB>)
	zstyle ':completion:*:cd:*' ignore-parents parent pwd
# Don't complete things which aren't available, such as the many zsh functions starting with an underscore
	zstyle ':completion:*:*:-command-:*:*' tag-order 'functions:-non-comp *' functions
	zstyle ':completion:*:functions-non-comp' ignore-patterns '_*'
	zstyle ':completion:*:functions' irnore-patterns '(_*|pre(cmd|exec))'
# Complete sudo commands
	zstyle ':completion::complete:*' gain-privileges 1
# Don't complete uninteresting users...
	zstyle ':completion:*:*:*:users' ignore-patterns \
		adm amanda apache avahi beaglidx bin cacti canna clamav daemon \
		dbus distcache dovecot fax ftp games gdm gkrellmd gopher \
		hacluster haldaemon halt hsqlbd ident junkbust ldap lp mail \
		mailman mailnull mldonkey mysql nagios \
		named netdump news nfsnobody nobody nscd ntp nut nx openvpn \
		operator pcap postfix postgres privoxy pulse pvm quagga radvd \
		rpc rpuser rpm shutdown squid sshd sync uucp vcsa xfs '_*'

# Function to visualise dir stack
	di() {
		dirs -v | head -${1:-11}
	}
	compdef _dirs di
