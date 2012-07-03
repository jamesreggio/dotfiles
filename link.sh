#!/bin/bash

function link() {
  local from=$1
  local to=$2
  for source in $(ls -d -1 $PWD/$from/*); do
    local destination="$to$(basename $source)"
    local current=$(readlink $destination)
    if [ "$current" = "$source" ]; then
      echo "Already $destination -> $source"
    else
      if [ "$current" ]; then
        echo "Previously $current"
      fi
      echo "Linking $destination -> $source"
      ln -s -i $source $destination
    fi
  done
}

link home "$HOME/."
