# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
    source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# # Sourcing bashrc
# autoload bashcompinit
# bashcompinit
# source $HOME/.bashrc

export CFLAGS=-Qunused-arguments
export CPPFLAGS=-Qunused-arguments
export JAVA_HOME=$(/usr/libexec/java_home)