#!/bin/bash

DMENU='dmenu -i -l 20'
SLASH="/"
EDITOR="nvim"

callAgain(){
    
    if [[ $1 == *"/q"* ]]; then
        exit
    fi

    choice=$(ls ${1} | $DMENU -p "Dir:")
    if [[ -f $1$SLASH$choice ]] 
    then
        $EDITOR $1$SLASH$choice
    else
        callAgain $1$SLASH$choice
    fi
}

callAgain $1


