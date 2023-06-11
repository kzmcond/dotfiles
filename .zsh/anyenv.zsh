#########
# anyenv
#########'
if [ -d $HOME/.anyenv ] ; then
    export PATH="$HOME/.anyenv/bin:$PATH"
    eval "$(anyenv init - --no-rehash)"
#    eval "$(anyenv init -)"
#    eval "$(anyenv init - zsh)"
    # tmux対応
    for D in `ls $HOME/.anyenv/envs`
    do
        export PATH="$HOME/.anyenv/envs/$D/shims:$PATH"
    done
fi

# pyenv-virtualenv
#eval "$(pyenv virtualenv-init -)"
#eval "$(pipenv --completion)"

#########
# goenv 
#########
#export GOPATH="$HOME/.go"
#export PATH="$GOPATH/bin:$PATH"
#eval "$(goenv init -)"
#GO111MODULE=on # ver 1.11以上

# コマンド補完(rbenv)
#source ~/.anyenv/envs/rbenv/completions/rbenv.zsh
