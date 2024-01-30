
alias curl-head='curl -o /dev/null -sD -'

alias convert-date='date -ju -f "%FT%T" "+%a, %e %b %Y %T +0001"'
alias iso-date-utc='date -u +"%Y-%m-%dT%H:%M:%SZ"'
alias iso-date-local="date +%Y-%m-%dT%H:%M:%S%z"

function pscount () {
    PSFILE=/tmp/ps-aux
    
    ps aux >$PSFILE
    if [ "$1" == "" ]; then
         # count all processes
         grep -v ^USER $PSFILE | sort | cut -b -8 | uniq -c | sort -n
    else 
    	 # count processes with name $1 (e.g. SCREEN, tf or irssi)
    	 egrep "[0-9] $1$" $PSFILE | cut -d' ' -f 1 | sort | uniq -c | sort -r
    fi
    rm $PSFILE
}


if [ "$HOST_COLOR" == "" ]; then
  export HOST_COLOR=32
fi

case `uname -s` in
    Linux)
        alias ls='ls --color=auto -F'
	eval `lessfile`
	;;
    Darwin)
        alias ls='ls -FGh'
	;;
    *)  
        alias ls='ls -Fh'
        ;;
esac

GIT_PS1_SHOWDIRTYSTATE=1
GIT_PS1_SHOWUNTRACKEDFILES=1
GIT_PS1_SHOWCOLORHINTS=true

export PS1="\$(date '+%Y-%m-%d %H:%M:%S') [\$(kubectx -c)]\n\u@\[\e[1;${HOST_COLOR}m\]\h\[\e[0m\]:\w\$(__git_ps1 \" (%s)\")$ "
export PATH=$PATH:~/bin:/usr/local/sbin
export PATH="/opt/homebrew/bin:$PATH"
export PATH="/opt/homebrew/sbin:$PATH"
alias d='ls -lA'
alias sr='screen -rd'

export LESS=-iQFXR

export BLOCK_SIZE='human-readable'

if [ -f /etc/bash_completion ]; then
  . /etc/bash_completion
fi

alias webserver='python -m SimpleHTTPServer 8000'

export LC_ALL=en_US.UTF-8
export GPG_TTY=$(tty)

# MacOS specific things here
if [ `uname -s` == "Darwin" ]; then
  export BASH_SILENCE_DEPRECATION_WARNING=1

  if [ -f `brew --prefix`/etc/bash_completion ]; then
    . `brew --prefix`/etc/bash_completion
  fi

  eval "$(direnv hook bash)"
  test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"
fi
