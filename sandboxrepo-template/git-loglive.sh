#!/bin/bash
# show the git tree every 1 second 

while :
do
    clear
    # git --no-pager log --graph --pretty=oneline --abbrev-commit --decorate --all $*
    git --no-pager log --graph --decorate --all --format="%h (%Cblue%an%Creset) %s" $*
    sleep 1
done
