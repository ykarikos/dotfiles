
alias curl-head='curl -o /dev/null -sD -'

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
        alias ls='ls -FG'
	;;
    *)  
        alias ls='ls -Fh'
        ;;
esac

export  PS1="\u@\[\e[1;${HOST_COLOR}m\]\h\[\e[0m\]:\w\$(__git_ps1 \" (%s)\")$ "
alias d='ls -lA'

export LESS=-iQFXR

export BLOCK_SIZE='human-readable'

if [ -f /etc/bash_completion ]; then
  . /etc/bash_completion
fi

alias webserver='python -m SimpleHTTPServer 8000'
