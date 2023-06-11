source /usr/share/powerline/bindings/zsh/powerline.zsh

function powerline_precmd() {
#    PS1="$(powerline-shell --shell zsh $?)"
    PS1="$(powerline-go --shell zsh $?)"
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
