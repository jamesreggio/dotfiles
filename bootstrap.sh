#!/bin/sh
set -e

# Clone dotfiles
dotfiles="$HOME/src/dotfiles"
playbook="$dotfiles/playbook.yml"
mkdir -p "$dotfiles"
[ -e "$playbook" ] || git clone git@github.com:jamesreggio/dotfiles.git "$dotfiles"
cd "$dotfiles"

# Install homebrew
which brew || bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

# Run ansible
brew install ansible
ansible-playbook -i hosts "$playbook"
