# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]
then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Check if the file .bash_aliases exist and load it into current shell session
if [ -f ~/.bash_aliases ]; then
	. ~/.bash_aliases
fi

# Check if the file .bash_safety exist and load it into current shell session
if [ -f ~/.bash_safety ]; then
	. ~/.bash_safety
fi

# Check if the .bash_functions file exist and load it into current shell session
if [ -f ~/.bash_functions ]; then
	. ~/.bash_functions
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
	for rc in ~/.bashrc.d/*; do
		if [ -f "$rc" ]; then
			. "$rc"
		fi
	done
fi

unset rc

# Set up fzf key bindings and fuzzy completion
eval "$(fzf --bash)"

# Fix kitty unknown terminal type
[[ "$TERM" == "xterm-kitty" ]] && alias ssh="TERM=xterm-256color ssh"
