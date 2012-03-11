#!/bin/sh

DOTFILES="$HOME/.dotfiles"

echo ". $DOTFILES/.bash_aliases" >>$HOME/.bashrc
cat $DOTFILES/.gitalias >>$HOME/.gitconfig
ln -s $DOTFILES/.gitignore_global $HOME/.gitignore_global
