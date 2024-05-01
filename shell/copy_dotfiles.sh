#!/bin/bash

giturl="https://raw.githubusercontent.com/quxdev/qconfig/main/shell"

# echo "Run this command from the prompt"
# echo '/bin/bash -c "$(curl -fsSL '${giturl}'/copy_shell_scripts.sh)"'

for f in bash_login bash_aliases qux_macosx qux_images qux_python; do
  if [[ -f $HOME/.${f} ]]; then
    echo "Found. Not copying ${f}"
  else
    echo "Not found. Copying ${f}"
    curl -fsSL ${giturl}/${f} > $HOME/.${f}
  fi
done
