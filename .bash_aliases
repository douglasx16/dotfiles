alias ccze='ccze -A'
alias cp='cp -ai'
alias mv='mv -i'
alias less='less -M'
alias grep='grep --color'
alias egrep='egrep --color'
alias rgrep='rgrep --color'
alias rsync='rsync -a  -H --delete -rlKHpEtS --delete --delete-excluded --force -z -v'
alias pstree='pstree -aAclnpu'
if [ $UID -eq 0 ]
then
  alias ls='ls --color -a'
  alias l='ls --color -lha'
  alias 1='ls -1a'
  alias rm='rm -i'
else
  alias ls='ls --color'
  alias l='ls --color -lh'
  alias 1='ls -1'
fi
alias atom='atom -n'
alias chrome='google-chrome'
alias be="bundle exec"
alias dotfiles='git --git-dir="$HOME"/src/dotfiles --work-tree="$HOME"'
alias root='sudo bash --rcfile "$HOME"/.bashrc'

alias d='docker'
alias g='git'
alias a='atom -n'
alias c='google-chrome'
alias myip="curl 'https://api.ipify.org/' && echo"
alias r='rails'

alias encode='xargs python -c "import urllib, sys; print urllib.quote(sys.argv[1])"'
alias decode='xargs python -c "import urllib, sys; print urllib.unquote(sys.argv[1])"'

alias rake='bundle exec rake'
