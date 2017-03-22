#!/usr/bin/env bash
# Bash helpers by erik (⌐■_■)

# Load a .env file into the shell environment
loadenv () {
  if [ "$1" ]; then
    echo "Loading env from ./$1"
    file="./$1"
  else
    echo "Loading .env"
    file=./.env
  fi

  if [ -e $file ]; then
    echo "found $file"
    for line in $(cat $file | grep ^[^#]); do
      echo "Exporting $line"
      eval "export $line"
    done
  else
    echo "Could not find $file"
    return 1
  fi
  return 0
}
