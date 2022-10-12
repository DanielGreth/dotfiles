## Useful variables for prompt
	local curdir="%~"
	local hostname="%M"
	local username="%n"
	local bold="%B"
	local unbold="%b"
	local standout="%S"
	local unstandout="%s"
	local underline="%U"
	local ununderline="%u"
	local colorfg="%F"
	local uncolorfg="%f"
	local colorbg="%K"
	local uncolorbg="%k"
	local mytime="%*"
	local mydate="%D"
	local line_tty="%y"
	local rootorwhat="%#"
	local return_status"%?"

# Necessary for fadebar (from zsh's bigfade prompt)
	autoload -Uz prompt_special_chars
	prompt_special_chars
if [ "$TERM" = "linux" ]; then # TTY prompt
	PS1="%B$colorbg{blue}$mytime$uncolorbg %F{green}[$username]%f %b%F{magenta}$curdir%f $rootorwhat "
else
	PS1=$
