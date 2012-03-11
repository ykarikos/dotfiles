
if [ "$HOST_COLOR" == "" ]; then
  export HOST_COLOR=32
fi

case `uname -s` in
    Linux)
        alias ls='ls --color=auto -F'
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

export LESS=-iQ
eval `lessfile`

export BLOCK_SIZE='human-readable'

if [ -f /etc/bash_completion ]; then
  . /etc/bash_completion
fi
