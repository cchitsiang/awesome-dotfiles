#!/usr/bin/env zsh

# Run as zsh
# OSX-only stuff. Abort if not OSX.
is_osx || return 1

# Exit if already link
if [[ "$(dscl . -read ~ UserShell | awk '{print $2}')" == "$binroot/zsh" ]]; then
    setopt EXTENDED_GLOB
    for rcfile in "${ZDOTDIR:-$HOME}"/vendor/prezto/runcoms/^README.md(.N); do
        ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
    done
fi

