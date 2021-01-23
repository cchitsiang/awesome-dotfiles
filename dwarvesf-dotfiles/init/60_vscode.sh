source $DOTFILES/source/60_vscode.sh

if test "$(which code)"; then
  if [ "$(uname -s)" = "Darwin" ]; then
    VSCODE_HOME="$HOME/Library/Application\ Support/Code"
  else
    VSCODE_HOME="$HOME/.config/Code"
  fi

  FILES_DIR="$DOTFILES/conf/vscode"
  files=(
    "settings.json"
    "keybindings.json"
    "syncLocalSettings.json"
  )

  for file in "${files[@]}"; do
    if [ -f "$VSCODE_HOME/User/$file" ]; then
      mv "$VSCODE_HOME/User/$file" "$FILES_DIR/"
      ln -sf "$FILES_DIR/$file" "$VSCODE_HOME/User/$file"
    fi
  done

  # install extensions
  # vscode_install_ext

  # defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false
fi
