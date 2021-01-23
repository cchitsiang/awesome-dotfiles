# loads node environment
source $DOTFILES/source/50_node.sh

# exit if nvm is not installed.
which nvm || return

# remove non-nvm installed node
rm -rf /usr/local/lib/node_modules
rm -f /usr/local/bin/npm
brew uninstall --force --ignore-dependencies node && brew prune

# install node lts
nvm install --lts

# exit if node is not installed.
which node || return 1

packages=(
  pure-prompt
  eslint
  tern
  svgo
  ttf2woff2
)

function node_install_packages() {
  e_header "Installing Node packages: ${packages[*]}"
  for package in "${packages[@]}"; do
    npm install -g $package
  done
}

node_install_packages
