#!/bin/bash
set -e
git clone https://github.com/Homebrew/brew homebrew
eval "$(~/homebrew/bin/brew shellenv)"
brew update --force --quiet
chmod -R go-w "$(brew --prefix)/share/zsh"
brew install python@3.10
brew install azcopy
python3.10 -m pip install tensorflow[and-cuda] torch numpy scipy
echo 'eval "$(~/homebrew/bin/brew shellenv)"' >> ~/.bashrc
echo 'alias python3=~/homebrew/bin/python3.10' >> ~/.bashrc
