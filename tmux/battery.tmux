main() {
  local OPTION="status-right"
  local OLD_VALUE="$(tmux show-option -gqv "$OPTION")"
  local BATTERY=$(pmset -g batt | grep -o "[0-9]*%")
  local UI="#[fg=#9ccfd8]"$BATTERY"%#[fg=#908caa] "

  tmux set-option -gq "$OPTION" "$UI $OLD_VALUE"
}

main

