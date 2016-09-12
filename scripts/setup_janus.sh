#!/bin/bash
set -e

./sanity_checks.sh

echo "Ensuring antigen is set up..."
if [ ! -f ~/.antigen.zsh ]; then
  curl https://cdn.rawgit.com/zsh-users/antigen/v1.1.0/bin/antigen.zsh > ~/.antigen.zsh
fi

echo "Ensuring Janus is set up..."
if [ ! -d ~/.vim/janus ]; then
  echo "Janus is not set up, installing now..."
  curl -L https://bit.ly/janus-bootstrap | bash
fi

echo "Ensuring Powerline is set up..."
if [ ! -d ~/.powerline ]; then
  rm -rf ~/.powerline || true
  echo "Cloning powerline..."
  git clone https://github.com/powerline/powerline.git ~/.powerline
  pushd ~/.powerline && \
    git checkout 6e2e0b2f9221fbff117be3d190f9293b40ba64cd && \
    popd

  if [ -d ~/.powerline/powerline/config_files ]; then
    rm -rf ~/.powerline/powerline/config_files
  fi
  mkdir -p ~/.powerline/powerline/config_files
  cp -r ../powerline-config/* ~/.powerline/powerline/config_files/
fi

echo "Updating submodules..."
cd ~/.janus
git submodule update --init --recursive

echo "Compiling YouCompleteMe..."
cd ./YouCompleteMe
./install.py --clang-completer --gocode-completer --tern-completer

echo "Done!"
