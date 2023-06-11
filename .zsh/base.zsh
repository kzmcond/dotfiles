#   gfで開く
# * $HOME/.zsh/base.zsh ($HOME/.zshrc)
#   $HOME/.zsh/alias.zsh
#   $HOME/.zsh/func.zsh
#   $HOME/.zsh/prompt.zsh
#   $HOME/.zsh/rbenv.zsh
#   $HOME/.zsh/anyenv.zsh
#   $HOME/.zsh/tmuxinator.zsh
#   $HOME/.zsh/tmux.zsh
#   $HOME/.zsh/linuxbrew.zsh
#   $HOME/.zsh/toggl.zsh

#export ZSH_ROOT=$HOME/.zsh

# LANG
#case $TERM in
#    linux) export LANG=C ;;
#    *) export LANG=ja_JP.UTF-8 ;;
#esac
#export LANG=ja_JP.UTF-8
#case ${UID} in
#0)
#    LANG=C
#    ;;
#esac

#case $TERM in
#  linux) LANG=C ;;
#  linux) LANG=en_US.UTF-8 ;;
#  *) LANG=ja_JP.UTF-8 ;;
#esac

#export LC_ALL=C
#export LANG=C
#export LANGUAGE=C
export LC_MESSAGE=C
export LC_TIME=C

######################################################################
# cdコマンドのサーチパス
cdpath=(.. ~ ~/src ~/zsh)
######################################################################
# Default Permission(file : 644, directory : 755)
umask 022
######################################################################
# エイリアス
setopt complete_aliases  # aliased ls needs if file/dir completions work

######################################################################
# csh風のsetenvを関数で定義
setenv() { typeset -x "${1}${1:+=}{(@)argv[2,$#]}" }
######################################################################
# autoloadされる関数を検索するパス
#fpath=($fpath ~/.zfunc)
fpath=(${HOME}/.zsh/functions/Completion ${HOME}/.zfunc ${fpath})
######################################################################
#################
# Docker Compose
#################
fpath=(~/.zsh/completion $fpath)
autoload -Uz compinit && compinit -i
#autoload -Uz compinit && compinit -c

######################################################################
# manマニュアルの設定されているディレクトリパス
#manpath=($X11HOME/man /usr/man /usr/lang/man /usr/local/man)
manpath=($X11HOME/man /usr/man /usr/lang/man /usr/local/man /usr/share/man /usr/local/share/man /usr/X11R6/man /opt/man)
export MANPATH

######################################################################
# その他の環境変数の定義
export MAIL=/var/spool/mail/$USERNAME
######################################################################
# ヒストリ
HISTSIZE=100000  # メモリに展開する履歴数
SAVEHIST=100000  # 保存する履歴数
HISTFILE=~/.zsh_history
DIRSTACKSIZE=20
# 単語の区切り
export WORDCHARS="*?_-.[]~=&;!#$%^(){}<>"
######################################################################
# Ruby
#export RUBYOPT="rubygems"
#export RI="--format ansi --width 70"

# Rails
#export BASE_PATH=$HOME/.rails/app_template/groundwork/base
######################################################################
# zshオプションの設定
setopt notify  # バックグラウンドジョブの状態を即座に表示
setopt globdots  # .で始まるファイルにもマッチさせる
setopt correct  # コマンド名のスペル訂正を試みる
setopt correctall  # 引数についてもスペル訂正を試みる
setopt pushdtohome  # 引数無しでpushdを実行するとpushd $HOME として動作
setopt cdable_vars  # 絶対パスが入った変数をディレクトリとみなす
setopt autolist  # 補完候補が複数ある場合、自動でメニューをリストアップ
setopt auto_cd  # ディレクトリ名のみで移動
setopt recexact
setopt longlistjobs  # ジョブリストにロングフォーマットを使用(jobs -l)
setopt autoresume  # ジョブの頭文字1文字のみでジョブの再実行を行う
setopt extended_history  # コマンドの実行時間もヒストリに記録
setopt histnostore  # historyコマンドをヒストリから除去
setopt histignorespace  # スペースで始まる行はヒストリに記録しない
setopt incappendhistory  # コマンド実行時にすぐにヒストリファイルに書き出す
setopt share_history  # 複数のzshセッションでヒストリをリアルタイムで共有
setopt hist_ignore_dups  # 同一コマンドを連続実行した場合、1つしか記録しない
setopt noclobber  # リダイレクトに伴うファイル作成／削除の挙動
setopt auto_pushd  # cdコマンドのみでディレクトリスタックにpushd
setopt pushdminus
setopt extended_glob  # 拡張グロブを使用(#,~,^を正規表現で使用)
#setopt rmstarsilent  # rmコマンドで*が指定された場合、確認を行わない
setopt pushdignoredups # 重複するディレクトリをpushd(登録)しない
setopt listpacked  # 補完候補を詰めて表示
setopt listrowsfirst  # 補完の表示順序を水平方向にする
setopt ignoreeof  # Ctrl + Dによるログアウトを抑制
setopt nobeep  # ビープ音を鳴らさない
setopt nolistbeep  # no beep sound when complete list displayed
setopt auto_menu  # Tabで補完候補を切替
setopt auto_param_keys  # カッコの対応を自動的に補完
setopt noautoremoveslash  # no remove postfix slash of command line
setopt nonomatch  # zsh: no matches found: 対策
unsetopt autoparamslash  # ディレクトリパスが格納された変数を補完した場合、末尾を/にする
#unsetopt promptcr  # 改行の無い出力をプロンプトで上書き禁止
#unsetopt flowcontrol  # P151
######################################################################
# zshモジュールのロード
zmodload -a zsh/stat stat  # statコマンド
zmodload -a zsh/zpty zpty
zmodload -a zsh/zprof zprof
zmodload -a zsh/mapfile mapfile
######################################################################
# Keybind configulation
# emacs like keybind
# (e.x. Ctrl-a gets to line head and Ctrl-e geto to end) and something additons

#export EDITOR=vim
export EDITOR=nvim
bindkey -e  # emacs mode
#bindkey -v  # vi mode

bindkey "^[[1~" beginning-of-line  # Home gets to line head
bindkey "^[[4~" end-of-line        # End gets to line end
bindkey "^[[3~" delete-char        # Del

# 矢印キーで単語移動
bindkey ";5C" forward-word
bindkey ";5D" backward-word
######################################################################
# 補完機能を有効にする
#autoload -Uz compinit
#compinit
######################################################################
# P146
#[ -n $(alias run-help) ] && unalias run-help
#autoload run-help
######################################################################
autoload zed  # zsh editor

# Prediction configuration
#autoload predict-on
#predict-off
######################################################################
# historical backward/sorward search with linehead string binded to ^P/^N
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end

# P148
#bindkey "^P" history-beginning-search-backward
bindkey "^p" history-beginning-search-backward-end
bindkey "^n" history-beginning-search-forward-end
bindkey "\\ep" history-beginning-search-backward-end
bindkey "\\en" history-beginning-search-forward-end

# reverse menu completion binded to Shift-Tab
bindkey "\e[Z" reverse-menu-complete

######################################################################
# Terminal configuration
case "${TERM}" in
screen)
    TERM=xterm
    ;;
esac

case "${TERM}" in
xterm|xterm-color)
    export LSCOLORS=exfxcxdxbxegedabagacad
    export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
    zstyle ':completion:*' list-colors 'di=34' 'ln=35' 'so=32' 'ex=31' 'bd=46;34' 'cd=43;34'
    ;;
kterm-color)
    stty erase '^H'
    export LSCOLORS=exfxcxdxbxegedabagacad
    export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
    zstyle ':completion:*' list-colors 'di=34' 'ln=35' 'so=32' 'ex=31' 'bd=46;34' 'cd=43;34'
    ;;
kterm)
    stty erase '^H'
    ;;
cons25)
    unset LANG
    export LSCOLORS=ExFxCxdxBxegedabagacad
    export LS_COLORS='di=01;34:ln=01;35:so=01;32:ex=01;31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
    zstyle ':completion:*' list-colors 'di=;34;1' 'ln=;35;1' 'so=;32;1' 'ex=31;1' 'bd=46;34' 'cd=43;34'
    ;;
jfbterm-color)
    export LSCOLORS=gxFxCxdxBxegedabagacad
    export LS_COLORS='di=01;36:ln=01;35:so=01;32:ex=01;31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
    zstyle ':completion:*' list-colors 'di=;36;1' 'ln=;35;1' 'so=;32;1' 'ex=31;1' 'bd=46;34' 'cd=43;34'
    ;;
esac 
 
# ターミナルのタイトル(Set terminal title including current directory)
case "${TERM}" in
xterm|xterm-color|kterm|kterm-color)
     precmd() {
         echo -ne "\033]0;${USER}@${HOST%%.*}:${PWD}\007"
     }
     ;;
esac

# RVM(Ruby Version Manager)
#[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" # Load RVM function
#PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

# dircolors
if [ -f ~/.dir_colors/dircolors ]
  then eval `dircolors ~/.dir_colors/dircolors`
fi

######################################################################
# Load user .zshrc configuration file
[ -f ${HOME}/.zshrc.mine ] && source ${HOME}/.zshrc.mine

# include
[ -f ~/.zsh/alias.zsh ] && source ~/.zsh/alias.zsh
[ -f ~/.zsh/func.zsh ] && source ~/.zsh/func.zsh
[ -f ~/.zsh/prompt.zsh ] && source ~/.zsh/prompt.zsh
[ -f ~/.zsh/anyenv.zsh ] && source ~/.zsh/anyenv.zsh
[ -f ~/.zsh/todoist.zsh ] && source ~/.zsh/todoist.zsh
[ -f ~/.zsh/toggl.zsh ] && source ~/.zsh/toggl.zsh
[ -f ~/.zsh/golang.zsh ] && source ~/.zsh/golang.zsh
[ -f ~/.zsh/ndenv.zsh ] && source ~/.zsh/ndenv.zsh
[ -f ~/.zsh/pyenv.zsh ] && source ~/.zsh/pyenv.zsh
[ -f ~/.zsh/tmux.zsh ] && source ~/.zsh/tmux.zsh
#[ -f ~/.zsh/rbenv.zsh ] && source ~/.zsh/rbenv.zsh
#[ -f ~/.zsh/linuxbrew.zsh ] && source ~/.zsh/linuxbrew.zsh
[ -f ~/.zsh/tmuxinator.zsh ] && source ~/.zsh/tmuxinator.zsh
######################################################################
#source ~/.tmuxinator/tmuxinator.zsh

# PATH
#if [ -d "$HOME/bin" ]; then
#  PATH="$HOME/bin:$PATH"
#fi

# neovim
export XDG_CONFIG_HOME=$HOME/.config
#export TERM=xterm-256color

# deoplete (neovim)
export NVIM_PYTHON_LOG_FILE=/tmp/log
export NVIM_PYTHON_LOG_LEVEL=DEBUG

# profile
#if (which zprof > /dev/null 2>&1) ;then
#  zprof | less
#fi

###########
# zcompile
###########
if [ ~/.zshrc -nt ~/.zshrc.zwc ]; then
  zcompile ~/.zshrc
fi

###########
# PATH整理
###########
typeset -U PATH
# 重複する要素を自動的に削除
typeset -U path cdpath fpath manpath
