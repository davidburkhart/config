#!/bin/sh

if [[ "$BLOCK_BUTTON" -eq 1 ]]; then
  i3-msg workspace $(($(i3-msg -t get_workspaces | jq ".[].num" | tail -1) + 1)) > /dev/null
fi

echo "new workspace"

