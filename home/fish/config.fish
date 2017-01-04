#Default Applications
set -gx PAGER less
set -gx EDITOR vim
#set -Ux VISUAL vim
set -gx BROWSER links2
set -gx SHELL fish

#Language
set -gx LANG fr_CA.UTF-8

#Compile flags
#set -Ux CC gcc
#set -Ux CXX g++
set -gx CFLAGS "-march=native -mtune=native -Wall -Wextra -pedantic"
set -gx CXXFLAGS $CFLAGS

#Change some default apps if we're running X.
if set -q DISPLAY
  set -x VISUAL gedit
  set -x BROWSER firefox
end

