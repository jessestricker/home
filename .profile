# shellcheck shell=sh

# Bash
if [ -n "$BASH_VERSION" ]; then
  # include .bashrc if it exists
  if [ -f "$HOME/.bashrc" ]; then
    # shellcheck source=/dev/null
    . "$HOME/.bashrc"
  fi
fi

# PATH
if [ -d "$HOME/bin" ]; then
  PATH="$HOME/bin:$PATH"
fi
if [ -d "$HOME/.local/bin" ]; then
  PATH="$HOME/.local/bin:$PATH"
fi
