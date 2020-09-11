# ~/.profile
# This file contains environment variables.
# It is sourced by ~/.bash_profile

# Neovim is the default text editor.
export VISUAL='/usr/bin/nvim'
export EDITOR='/usr/bin/nvim'

# fzf will use fd to search for files and directories.
export FZF_DEFAULT_COMMAND='fd --color=always --hidden --follow --exclude .git'

# Makes fzf handle color output (which will come from fd).
export FZF_DEFAULT_OPTS='--ansi'

# Keybinds for using nnn plugins. Press a key after pressing ;
export NNN_PLUG='n:bulknew;d:dups;c:fzcd;h:fzhist;o:fzopen;u:getplugs;v:imgview;i:imgur;g:organize;k:pskill;e:suedit'

export BAT_THEME='Nord'
