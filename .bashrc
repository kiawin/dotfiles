# Ref: https://github.com/brainss/dotfiles/blob/master/.bashrc

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.aliases ]; then
    . ~/.aliases
fi

if [ -f ~/.work-aliases ]; then
    . ~/.work-aliases
fi

# Docker Bash aliases
# Ref: https://raw.githubusercontent.com/jessfraz/dotfiles/master/.dockerfunc
# if [ -f ~/.dockerfunc ]; then
#     . ~/.dockerfunc
# fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

#PATH - Brian 12/9/2012
PATH=~/bin:$PATH
export PATH

# Ruby -Brian 12/9/2012
# This loads RVM into a shell session.
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

# General environment variables
export EDITOR=/usr/bin/vim
export GIT_EDITOR=/usr/bin/vim
export BROWSER="google-chrome"

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

# display hack
export DISPLAY=:0.0

# java
export JAVA_HOME=/usr/lib/jvm/default

# Load pyenv automatically by adding
# the following to ~/.bashrc:

export PATH="/home/sianlerk/.pyenv/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

# xz multiprocessing
export XZ_DEFAULTS="-T 0"

