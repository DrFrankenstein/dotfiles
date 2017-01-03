#!/usr/bin/fish

#Default Applications
set -Ux PAGER less
set -Ux EDITOR vim
#set -Ux VISUAL vim
set -Ux BROWSER links2
set -Ux SHELL fish

#Language
set -Ux LANG fr_CA.UTF-8

#Compile flags
#set -Ux CC gcc
#set -Ux CXX g++
set -Ux CFLAGS "-march=native -mtune=native -Wall -Wextra -pedantic"
set -Ux CXXFLAGS $CFLAGS

