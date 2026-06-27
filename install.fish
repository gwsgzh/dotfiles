#!/bin/fish

set dir (realpath (dirname (status filename)))

echo "Setting stow......"

stow -d $dir -t $HOME .

echo "Stowed."


echo "linking root_init.lua -> /root/.config/nvim/init.lua"

sudo mkdir -p "/root/.config/nvim/"
sudo ln -sf "$dir/root_init.lua" "/root/.config/nvim/init.lua"

echo "Done"
