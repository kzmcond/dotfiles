#   gfで開く
#   $HOME/.zsh/base.zsh ($HOME/.zshrc)
#   $HOME/.zsh/alias.zsh
#   $HOME/.zsh/func.zsh
#   $HOME/.zsh/prompt.zsh
#   $HOME/.zsh/rbenv.zsh
#   $HOME/.zsh/anyenv.zsh
#   $HOME/.zsh/tmuxinator.zsh
#   $HOME/.zsh/tmux.zsh
#   $HOME/.zsh/linuxbrew.zsh
#   $HOME/.zsh/toggl.zsh

toggl_current() {
  local tgc=$(toggl --cache --csv current)
  local tgc_time=$(echo $tgc | grep Duration | cut -d ',' -f 2)
  local tgc_dsc=$(echo $tgc | grep Description | cut -d ',' -f 2 | cut -c 1-20)
  local short_tgc_dsc=$(if [ $(echo $tgc_dsc | wc -m) -lt 20 ]; then echo $tgc_dsc; else echo "${tgc_dsc}.."; fi)
  if [ ! -n "$tgc_time" ]; then
      echo "NoTimeEntry"
  else
      echo "[$tgc_time $short_tgc_dsc]"
  fi
}
