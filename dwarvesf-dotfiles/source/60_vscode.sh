which code > /dev/null || return 1

vscode_backup_ext() {
  code --list-extensions > "$DOTFILES/conf/vscode/extensions.txt"
}

vscode_install_ext() {
  cat "$DOTFILES/conf/vscode/extensions.txt" | xargs -L1 code --install--extension
}
