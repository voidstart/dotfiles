# zshrc
# vim: fdm=marker 
# --- Oh-my-zsh ---{{{
ZSH=$HOME/.oh-my-zsh
ZSH_THEME="robbyrussell"
DISABLE_AUTO_TITLE="true"
plugins=(git history-substring-search zsh-syntax-highlighting ruby rails3 bundler)
source $ZSH/oh-my-zsh.sh
unsetopt correct_all
# }}}

# My own zsh completions {{{
#if [ -d ~/hub/dev-config/zcomp ]; then
#  fpath=(~/hub/dev-config/zcomp $fpath)
#  autoload -U compinit
#  compinit -i
#  zstyle ':completions:*' menu select=2
#fi
# }}}

# ---------- Aliases ----{{{
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias gs='git status -s'
alias gu='git add -u'
alias gv='git branch -v'
alias gfc='git diff --cached'
alias gf='git diff'
alias gr='git remote -v'
alias gtm='git commit -am WIP'
alias gup='git commit -m update; git push;'
alias tiga='tig --all'
alias em='emacs -nw'
# }}}

# --------- HOSTs specific ---{{{
W_HOST=$(hostname)
W_ME=$(whoami)
if [ "$W_HOST" = "gdc218" ]; then
# GDC 218 aliases {{{
  alias cdhub='cd /home/wangwei/hub/btr/'
  alias cdcvs='cd /home/wangwei/code/master_cvs/'
  alias cdupgrade='cd /data/shared/SM-OS-upgrade_wangwei/'
  alias gup='git add -u .; git commit -am update; git push;'
  alias make='make -j4'
  alias sa='start_agent'
  alias ppcstrip='/opt/eldk-4.2/usr/bin/ppc_4xx-strip'
  PATH=$HOME/lol/bin:$QTDIR/bin:$PATH:/usr/local/bin
# }}}
# ECO {{{
elif [ "$hostnm" = "eco" ]; then
  :
# }}}
# REST {{{
else
  if [ "$W_ME" = "root" ]; then
    alias dl='/home/down'
    alias dis='display -size 2048x1080 -depth 8'
    [ -f /etc/profile.d/rvm.sh ] && source /etc/profile.d/rvm.sh
    PATH=$PATH:/root/.bin:/usr/local/bin
    PATH=$PATH:/root/.gem/ruby/1.9.1/bin
  fi
fi
# }}}
# }}}

# --------- SSH Agent {{{
  SSH_ENV="$HOME/.ssh/environment"
  function start_agent {
       echo "Initialising new SSH agent..."
       /usr/bin/ssh-agent | sed 's/^echo/#echo/' > "${SSH_ENV}"
       echo succeeded
       chmod 600 "${SSH_ENV}"
       . "${SSH_ENV}" > /dev/null
       /usr/bin/ssh-add;
  }
# }}}

# --------- Ruby Env ----{{{
if [ -d $HOME/.rbenv ]; then
  PATH="$HOME/.rbenv/bin:$PATH"
  eval "$(rbenv init -)"
fi
# }}}

# --------- Digital Cinema Tools Env ----{{{
if [ -d $HOME/.digi_bin ]; then
  PATH="$HOME/.digi_bin:$PATH"
fi
# }}}

# --------- Exports ----{{{
#[ -z "$TMUX" ] && export TERM=xterm-256color
LS_COLORS='no=00:fi=00:di=00;94:ln=04;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:su=37;41:sg=30;43:tw=30;42:ow=35:st=37;44:ex=32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.gz=01;31:*.bz2=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.avi=01;35:*.fli=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.flac=01;35:*.mp3=01;35:*.mpc=01;35:*.ogg=01;35:*.wav=01;35:*.cpp=00;36:*.h=00;36:*.pro=01;07;34:*tags=04;37:*.ui=00;34:*.ts=00;90:*.c=00;94:*changelog=01;07:*Makefile=01;07;34:';
export LS_COLORS
export PATH
# }}}

#alias fix='git add -u .; git commit -m fixit; git push;'
PATH=$PATH:/home/wangwei/exp/go/bin
alias cvs8x='cd ~/code/8x_cvs'

export PATH="/usr/local/bin:$HOME/.bin:$PATH"

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
# ML New Jersey
export PATH="$PATH:/usr/local/smlnj-110.75/bin"

if [ -d $HOME/.rvm/bin ]; then
	PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
fi
if [ -d /Users/dw/.rvm/scripts/rvm ]; then
	source /Users/dw/.rvm/scripts/rvm
fi
export LANG=en_US.UTF-8

# keep rbenv stuff under homebrew
export RBENV_ROOT=/usr/local/var/rbenv

if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
