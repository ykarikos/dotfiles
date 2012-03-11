#!/bin/sh

DOTFILES="$HOME/.dotfiles"

cat $DOTFILES/.gitalias >>$HOME/.gitconfig
ln -s $DOTFILES/.gitignore_global $HOME/.gitignore_global
