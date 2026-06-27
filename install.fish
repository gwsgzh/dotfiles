#!/bin/fish

echo "Applying stow..."
stow .

# TODO: figure out a better way to do this

sudo mkdir -p "/root/.config/nvim/"
sudo ln -sf "$PWD/root_init.lua" "/root/.config/nvim/init.lua"
