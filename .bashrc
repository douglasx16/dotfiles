# enable bash completion in interactive shells > apt-get install bash-completion; apt-get install --reinstall bash-completion
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi
# include functions
if [ -f ~/.functions ]; then
  . ~/.functions
fi


# include aliases
if [ -f ~/.bash_aliases ]; then
  . ~/.bash_aliases
fi
# git auto_complete
if [ -f ~/.bash_git ]; then
  . ~/.bash_git
fi

# Editor
export EDITOR=vim

# configure PS1
if [ 0 -eq $UID ]
then
  PS1='`if [ $? = 0 ]; then echo "\[\033[01;32m\]✔"; else echo "\[\033[01;31m\]✘"; fi` \[\033[01;31m\]\u\[\033[01;31m\] \[\033[01;31m\]\t\[\033[01;31m\] \w\[\033[35m\] \[\033[01;31m\]#\[\033[00m\] '
else
  GIT_PS1_SHOWDIRTYSTATE=true
  GIT_PS1_SHOWSTASHSTATE=true
  GIT_PS1_SHOWUNTRACKEDFILES=true
  GIT_PS1_SHOWUPSTREAM="auto"
  GIT_PS1_SHOWCOLORHINTS=true

  PS1='`if [ $? = 0 ]; then echo "\[\033[01;32m\]✔"; else echo "\[\033[01;31m\]✘"; fi` \[\033[01;30m\]\t\[\033[01;34m\] \w\[\033[35m\]$(__git_ps1) \[\033[01;34m\]$\[\033[00m\] '
  unset color_prompt force_color_prompt
fi

for BASHRC in "$HOME"/.bashrc.d/*.sh
do
  [ -f "$BASHRC" ] || continue
  source "$BASHRC"
done

if [ -f ~/.local_data ]; then
  . ~/.local_data
fi

export PATH="$HOME/.rbenv/versions/2.3.1/bin:$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

export PATH="$HOME/.pyenv/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

export HISTTIMEFORMAT="%Y-%h-%d - %H:%M:%S "

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

### Bash history
export HISTSIZE=-1
export HISTFILESIZE=-1
export JAVA_HOME=/opt/jdk1.8.0_151/
