
if [ "$HOST_COLOR" == "" ]; then
  export HOST_COLOR=32
fi

export  PS1="\u@\[\e[1;${HOST_COLOR}m\]\h\[\e[0m\]:\w\$(__git_ps1 \" (%s)\")$ "
alias ls='ls -Fh'
alias d='ls -lA'
export LESS=-iQ
