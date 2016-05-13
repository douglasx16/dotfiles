# include functions
if [ -f ~/.functions ]; then
  . ~/.functions
fi


# include aliases
if [ -f ~/.bash_aliases ]; then
  . ~/.bash_aliases
fi

# Editor
export EDITOR=vim

# configure PS1
if [ 0 -eq $UID ]
then
  PS1='`if [ $? = 0 ]; then echo "\[\033[01;32m\]✔"; else echo "\[\033[01;31m\]✘"; fi` \[\033[01;31m\]\u\[\033[01;31m\] \[\033[01;31m\]\t\[\033[01;31m\] \w\[\033[35m\] \[\033[01;31m\]#\[\033[00m\] '
else
  GIT_PS1_SHOWDIRTYSTATE=true
  PS1='`if [ $? = 0 ]; then echo "\[\033[01;32m\]✔"; else echo "\[\033[01;31m\]✘"; fi` \[\033[01;30m\]\t\[\033[01;34m\] \w\[\033[35m\]$(__git_ps1) \[\033[01;34m\]$\[\033[00m\] '
  unset color_prompt force_color_prompt
fi

for BASHRC in "$HOME"/.bashrc.d/*.sh
do
  [ -f "$BASHRC" ] || continue
  source "$BASHRC"
done
