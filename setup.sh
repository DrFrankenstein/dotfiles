#!/bin/sh

try_install()
{
  if ! command -v $1 >/dev/null 2>&1
  then
    echo "We need '%1'. Attempting to install..."
  
    if [[ $EUID -ne 0 ]]
    then
      echo "...but we're not allowed. Please run me as root."
      exit 1
    fi
  
    if ! command -v apt >/dev/null 2>&1
    then
      echo "Cannot install fish: Only 'apt'-based distributions are currently supported."
      exit 1
    fi
  
    apt install $2
  fi
}

try_install fish fish
try_install git git

echo -n "Checking for updates... "
git pull || exit 1

echo "Applying setup..."
fish setup.fish

