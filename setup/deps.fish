#!/usr/bin/fish

function try_install -a pkgnames -d "Try to install packages; print a warning on failure"
  apt install $pkgnames
    or echo -s "dotfiles: WARNING: cannot install one or more of the following missing dependencies: " (string join , $pkgnames) ". Run me again as root and check your system's packages." >&2
end

function ensure_dep -a cmd pkgname -d "Ensure that a dependency is installed"
  echo -n "Checking for $cmd... "
  if not command -s $cmd
    set -g toinstall $toinstall $pkgname
    echo "Missing."
  end
end

ensure_dep vim vim
ensure_dep links2 links2
ensure_dep less less
if set -q toinstall
  try_install $toinstall
  set -e toinstall
end
