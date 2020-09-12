# ~/.bashrc
# This file contains settings for the interactive shell.
# It is sourced by ~/.bash_profile

[[ "$-" != *i* ]] && return

# user@host directory λ 
PS1='\[\e[36m\]\u\[\e[37m\]@\[\e[36m\]\h \[\e[33m\]\W \[\e[90m\]λ \[\e[39m\]'

# Bash will load the 500 most recent entries from the history file.
HISTFILESIZE=10000

# Duplicates of the command you just typed will be deleted from the history buffer.
HISTCONTROL='erasedups'

# Every command you type will be saved in the history file.
# This includes duplicates, which will be removed by the clean_bash_history function.
PROMPT_COMMAND='history -a'

# New history will be appended to the file, rather than overwriting it.
# This is only needed if HISTFILESIZE is greater than HISTSIZE.
# Without this, the number of file entries will never exceed HISTSIZE.
shopt -s histappend

# Typing a directory name will cd into that directory.
shopt -s autocd

# Sourcing this adds the n user command which makes nnn cd on quit.
[[ -f /usr/share/nnn/quitcd/quitcd.bash_zsh ]] && \
	. /usr/share/nnn/quitcd/quitcd.bash_zsh

# Contains the history cleaning functions clean_bash_history() and hhhh(). 
# Use hhhh to load history from other terminals into your current session.
# Also contains variables and functions needed to integrate fd into fzf.
[[ -f "$HOME"/.variables ]] && . "$HOME"/.variables

# This contains convenience aliases for git, and exa (which shadows ls).
# The -e flag is added to the nnn command to make nnn open text in an editor.
# You should take a look at this file.
[[ -f "$HOME"/.aliases ]] && . "$HOME"/.aliases

# These are needed to enable fzf keybinds and completion.
[[ -f /usr/share/fzf/key-bindings.bash ]] && \
	. /usr/share/fzf/key-bindings.bash
[[ -f /usr/share/fzf/completion.bash ]] && \
	. /usr/share/fzf/completion.bash

# Duplicates will be removed from the bash history file at start.
# History is loaded after the function cleans it.
clean_bash_history

# Duplicates will be removed from the bash history file at exit.
trap clean_bash_history EXIT
