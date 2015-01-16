#!/bin/bash

ln -sf "$(pwd)/.gitconfig" ~
ln -sf "$(pwd)/.vimrc" ~

mkdir -p ~/.config/fish
ln -sf "$(pwd)/.config/fish/config.fish" ~/.config/fish/

# WARNING: deletes ~/.vim and symlinks it
rm -rf ~/.vim
ln -sf "$(pwd)/.vim/" ~
