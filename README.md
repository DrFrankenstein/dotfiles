# DrFrankenstein's dotfiles
Or, what happens when a Windows guy tries to customise a Linux system.

## History
I've been an occasional Linux user since around 2004, using it as my secondary OS during most of that time, and even as my primary OS for about a year. I progressively learned my way around the shell, utility, config files, directory structure, etc. throughout that time, but I never really strayed away from the defaults, except for a thing or two, and I used GUIs whenever I could get away with it. So I'm a functional Linux (and *nix) user, but I'm no expert.

After support for Linux applications was added to Windows, I found myself using a Linux shell a *lot* more often, and on more computers. Customisation ensued, and I began having a hard time syncing my settings between all my Windows *and* Linux systems at home, at work, etc. So I finally decided to do like the cool kids and put it all up on GitHub for easy syncing.

## Feedback
With that in mind, if you see something that could be improved because of a poor practice, a bug or something else, you are welcome to open [an issue or a pull request][1]. I'm more than certain that there's a lot of room for constructive advice and improvement here.

Suggestions for additional customisations like aliases, plugins, packages, etc. are also welcome, but since this is my personal dotfiles repo, the final decision for inclusion is pretty much arbitrary. Which brings us to...

## Usage
You can download `setup.sh` and run it on your system. However, it is highly recommended that you:
1. Fork this repository mand make it your own!
2. Review the configuration files and setup scripts carefully,
3. Make additional customisations, merge your own already-existing config files,
4. Run `setup.sh`.

This is also how you should add any personal customisations that are not present in my system. If you think that one of your additions could be useful for this repo as well, do open a pull request for it.

## Details
### Shell
My shell of choice is `fish`, and most of this repository's scripts are written for it. On the plus side, its syntax/grammar is somewhat saner than other that of other POSIX shells, and it has a nice set of basic functionality and useful defaults; on the minus side, well, it's not POSIX-compliant.

### Directory Structure
TBD.

[1]: https://github.com/DrFrankenstein/dotfiles/issues
