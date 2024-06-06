#!bin/bash

sudo apt install nvim
mkdir -p ~/.config/nvim

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$SCRIPT_DIR"
mv ./* ~/.config/nvim
#

git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim
nvim --headless +PackerSync +qa
