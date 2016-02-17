#!/bin/sh
set -x
set -e

# Clone dotfiles
dotfiles="$HOME/src/dotfiles"
mkdir -p "$dotfiles"
[ -d "$dotfiles" ] || git clone git@github.com:jamesreggio/dotfiles.git "$dotfiles"
cd "$dotfiles"

# Install homebrew
which brew || ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Run ansible
brew install ansible
ansible-playbook -i hosts playbook.yml
