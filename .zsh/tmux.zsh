#   gfで開く
#   $HOME/.zsh/base.zsh ($HOME/.zshrc)
#   $HOME/.zsh/alias.zsh
#   $HOME/.zsh/func.zsh
#   $HOME/.zsh/prompt.zsh
#   $HOME/.zsh/rbenv.zsh
#   $HOME/.zsh/anyenv.zsh
#   $HOME/.zsh/tmuxinator.zsh
# * $HOME/.zsh/tmux.zsh
#   $HOME/.zsh/linuxbrew.zsh

###########
# 自動起動
###########
if [ -z $TMUX ]; then
  if $(tmux has-session); then
    tmux -2 attach
  else
    tmux -2
  fi
fi
