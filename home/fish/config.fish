#Change some default apps if we're running X.
if set -q DISPLAY
  set -x VISUAL gedit
  set -x BROWSER firefox
end

