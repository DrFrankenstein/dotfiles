#!/usr/bin/fish

function try_install -a pkgname -d "Try to install a package, or print a warning"
  apt install $pkgname
    or echo "dotfiles: WARNING: cannot install dependency $pkgname. Run me again as root and check your system's packages." >&2
end

function ensure_dep -a cmd pkgname -d "Ensure that a dependency is installed"
  if not command -s $cmd
    try_install $pkgname
  end
end

if is_ubuntu
  apt-add-repository ppa:fish-shell/release-2
end

ensure_dep vim vim
ensure_dep links2 links2
ensure_dep less less

