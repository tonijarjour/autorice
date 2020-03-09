# ~/.bashrc
# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias vi='nvim'
alias vim='nvim'
alias l='exa -Fhl --git'
alias la='exa -Fhla --git'
alias ls='exa -F'
alias lsa='exa -Fa'
alias ga='git add'
alias gl='git pull'
alias gre='git reset'
alias gss='git status'
alias gck='git checkout'
alias gd='git diff'
alias gc='git commit -m'
alias gcam='git commit -am'
alias gp='git push'
alias copy='xclip -se c'
alias imgc='xclip -se c -t image/png -i'
# alias neofetch='printf "\n\n" && neofetch && echo'
PS1='\[\e[36m\]\u\[\e[37m\]@\[\e[36m\]\h \[\e[33m\]\W \[\e[90m\]λ \[\e[39m\]'

bind 'set completion-ignore-case on'

[[ -f /usr/share/fzf/key-bindings.bash ]] && . /usr/share/fzf/key-bindings.bash
[[ -f /usr/share/fzf/completion.bash ]] && . /usr/share/fzf/completion.bash
