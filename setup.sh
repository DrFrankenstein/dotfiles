#!/bin/sh

muffled()
{
  $@ >/dev/null 2>&1
}

ensure_installed()
{
  if ! muffled command -v $1
  then
    echo "We need '%1'. Attempting to install..."
  
    if [ $EUID -ne 0 ]
    then
      echo "...but we're not allowed. Please run me as root."
      exit 1
    fi
  
    if ! muffled command -v apt
    then
      echo "Cannot install fish: Only 'apt'-based distributions are currently supported."
      exit 1
    fi
  
    apt install $2
  fi
}

while getopts "c" arg
do
  case $arg in
    c) contained=1 ;;
    \?) exit 1 ;;
  esac
done

# grab our basic dependencies...
ensure_installed fish fish
ensure_installed git git

# are we in our repo?
muffled git status
if [ $? -eq 128 ]
then
  # nope, actually download dotfiles
  echo -n "Starting initial download... "

  if [ -e dotfiles ]
  then
    read -p "'dotfiles' exists. Please enter a name for a directory to store the files in: " dirname
  else
    dirname=dotfiles
  fi

  if git clone "https://github.com/DrFrankenstein/dotfiles.git" $dirname
  then
    cd $dirname
    . ./setup.sh $@
  fi
  exit
fi

echo -n "Updating dotfiles... "
git pull || exit 1

echo "Applying setup..."
fish setup.fish $@

