for v in "gh" "gl" "bb"; do
  function=$DOTFILES/vendor/gh/bash/$v.bash
  completion=$DOTFILES/vendor/gh/completions/$v.bash

  if [ -f $function ]; then
    source $function
  fi

  if [ -f $completion ]; then
    source $completion
  fi
done
