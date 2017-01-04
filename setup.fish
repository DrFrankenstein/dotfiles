#!/usr/bin/fish

pushd (dirname (status -f))

source setup/deps.fish
source setup/env.fish

popd

echo "ALL DONE! :D"
