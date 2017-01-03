function muffle -d "Suppresses output from a command"
  eval $argv >/dev/null 2>&1
end
