#!/bin/bash

echo "Setting up dotfiles..."
cd ./scripts
./install_dotfiles.sh
./setup_janus.sh
