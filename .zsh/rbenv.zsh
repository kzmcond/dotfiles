#   gfで開く
#   $HOME/.zsh/base.zsh ($HOME/.zshrc)
#   $HOME/.zsh/alias.zsh
#   $HOME/.zsh/func.zsh
#   $HOME/.zsh/prompt.zsh
# * $HOME/.zsh/rbenv.zsh
#   $HOME/.zsh/anyenv.zsh
#   $HOME/.zsh/tmuxinator.zsh
#   $HOME/.zsh/tmux.zsh
#   $HOME/.zsh/linuxbrew.zsh

########
# rbenv
########'
export PATH="$HOME/.rbenv/bin:$PATH"

# Add rbenv init to your shell to enable shims and autocompletion.
eval "$(rbenv init -)"

#※コマンド補完
source ~/.rbenv/completions/rbenv.zsh
