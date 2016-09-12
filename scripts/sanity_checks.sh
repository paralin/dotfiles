#!/bin/bash

ROOT=../
if ! [ "$HOME/.janus" -ef $ROOT ]; then
  echo "This repo is not located at ~/.janus. Quitting."
  exit 1
fi
