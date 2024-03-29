function powerline_precmd() {
#    PS1="$(~/go/bin/powerline-go -error $? -shell zsh)"
    PS1="$(~/go/bin/powerline-go \
      -error $? \
      -shell zsh \
      -colorize-hostname \
      -theme "default"
      )"
}

function install_powerline_precmd() {
  for s in "${precmd_functions[@]}"; do
    if [ "$s" = "powerline_precmd" ]; then
      return
    fi
  done
  precmd_functions+=(powerline_precmd)
}

if [ "$TERM" != "linux" ]; then
    install_powerline_precmd
fi
