# Load profile
[[ -s "$HOME/.profile" ]] && source "$HOME/.profile"

# Bash Prompt
[[ -s "$HOME/.bash_prompt" ]] && source "$HOME/.bash_prompt"

# Load bashrc
if [[ $EUID != 0 ]]; then
  [[ -f ~/.bashrc ]] && . ~/.bashrc
fi

# Bash dircolors
# Ref: https://raw.githubusercontent.com/jtheoof/dotfiles/master/dircolors.monokai
eval $(dircolors $HOME/.dir_colors/dircolors.monokai)

# Enable ssh agent forwarding
eval $(keychain --eval --agents ssh -Q --quiet /home/sianlerk/.ssh/google_compute_engine)
if [[ $(ssh-add -l | grep ED25519 | wc -l) == 0 ]]; then
    ssh-add /home/sianlerk/.ssh/id_ed25519.github
    ssh-add /home/sianlerk/.ssh/id_ed25519.jewel
fi

# Enable rvm

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

# Enable pyenv

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi
eval "$(pyenv virtualenv-init -)"

# Enable Hub for github
eval "$(hub alias -s)"
