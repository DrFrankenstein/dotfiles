#!/bin/sh

muffled()
{
  $@ >/dev/null 2>&1
}

have_fish_ppa()
{
  muffled command -v lsb_release && [ `lsb_release -is` = "Ubuntu" ] && [ -e /etc/apt/sources.list.d/fish-shell-release-2*.list ]
}

ensure_installed()
{
  if ! muffled command -v $1
  then
    echo "We need $1. Attempting to install..."
  
    if [ $EUID -ne 0 ]
    then
      echo "...but we're not allowed. Please run me as root."
      exit 1
    fi
  
    if ! muffled command -v apt
    then
      echo "Cannot install $1: Only 'apt'-based distributions are currently supported."
      exit 1
    fi
 
    apt install $2
  fi
}

while getopts "s" arg
do
  case $arg in
    s) simulate=1 ;;
    \?) exit 1 ;;
  esac
done

# we need the latest 'fish' version if we can grab it easily enough
if [ ! $simulate ] && ! have_fish_ppa
then
  apt-add-repository -y ppa:fish-shell/release-2
  apt update
fi

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
git pull || exit

echo "Applying setup..."
fish setup.fish $@

