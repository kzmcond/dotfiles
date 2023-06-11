######################################################################
# include
######################################################################
[ -f ${HOME}/.zshrc.mine ] && source ${HOME}/.zshrc.mine

export PATH="$HOME/local/bin:$PATH"

[ -f ~/.zsh/alias.zsh ] && source ~/.zsh/alias.zsh
[ -f ~/.zsh/func.zsh ] && source ~/.zsh/func.zsh
[ -f ~/.zsh/anyenv.zsh ] && source ~/.zsh/anyenv.zsh
[ -f ~/.zsh/golang.zsh ] && source ~/.zsh/golang.zsh
[ -f ~/.zsh/deno.zsh ] && source ~/.zsh/deno.zsh
[ -f ~/.zsh/cargo.zsh ] && source ~/.zsh/cargo.zsh
[ -f ~/.zsh/python.zsh ] && source ~/.zsh/python.zsh
[ -f ~/.zsh/ruby.zsh ] && source ~/.zsh/ruby.zsh
[ -f ~/.zsh/gh.zsh ] && source ~/.zsh/gh.zsh
#[ -f ~/.zsh/powerline.zsh ] && source ~/.zsh/powerline.zsh
#[ -f ~/.zsh/p10k.zsh ] && source ~/.zsh/p10k.zsh
[ -f ~/.zsh/starship.zsh ] && source ~/.zsh/starship.zsh
[ -f ~/.zsh/volta.zsh ] && source ~/.zsh/volta.zsh
[ -f ~/.zsh/asdf.zsh ] && source ~/.zsh/asdf.zsh
[ -f ~/.zsh/zoxide.zsh ] && source ~/.zsh/zoxide.zsh
#[ -f ~/.zsh/powerline-go.zsh ] && source ~/.zsh/powerline-go.zsh
#[ -f ~/.zsh/prompt.zsh ] && source ~/.zsh/prompt.zsh
#[ -f ~/.zsh/tmux.zsh ] && source ~/.zsh/tmux.zsh
#[ -f ~/.zsh/tmuxinator.zsh ] && source ~/.zsh/tmuxinator.zsh

#[ -f ~/.zsh/todoist.zsh ] && source ~/.zsh/todoist.zsh
#[ -f ~/.zsh/toggl.zsh ] && source ~/.zsh/toggl.zsh

[ -f ~/.zsh/linuxbrew.zsh ] && source ~/.zsh/linuxbrew.zsh
#[ -f ~/.zsh/rbenv.zsh ] && source ~/.zsh/rbenv.zsh
#[ -f ~/.zsh/pyenv.zsh ] && source ~/.zsh/pyenv.zsh
#[ -f ~/.zsh/nodenv.zsh ] && source ~/.zsh/nodenv.zsh
[ -f ~/.zsh/npm.zsh ] && source ~/.zsh/npm.zsh
[ -f ~/.zsh/docker-compose.zsh ] && source ~/.zsh/docker-compose.zsh
#[ -f ~/.zsh/zprezto.zsh ] && source ~/.zsh/zprezto.zsh
#[ -f ~/.zsh/zinit.zsh ] && source ~/.zsh/zinit.zsh
[ -f ~/.zsh/plugins.zsh ] && source ~/.zsh/plugins.zsh
[ -f /etc/zsh_command_not_found ] && source /etc/zsh_command_not_found
# bun completions
[ -s "/home/kzmcond/.bun/_bun" ] && source "/home/kzmcond/.bun/_bun"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
#[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
######################################################################

# Dracula Theme
ZSH_THEME="/home/kzmcond/Desktop/dracula_theme/zsh-master/"
## FZF
export FZF_DEFAULT_OPTS='--color=fg:#f8f8f2,bg:#282a36,hl:#bd93f9 --color=fg+:#f8f8f2,bg+:#44475a,hl+:#bd93f9 --color=info:#ffb86c,prompt:#50fa7b,pointer:#ff79c6 --color=marker:#ff79c6,spinner:#ffb86c,header:#6272a4'

#############################
# Customize to your needs...
#############################
#export ZSH_ROOT=$HOME/.zsh

case $TERM in
  linux) export LANG=C ;;
  xterm-256color) export LANG=en_US.UTF-8 ;;
  *) export LANG=ja_JP.UTF-8 ;;
esac

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
#setenv() { typeset -x "${1}${1:+=}{(@)argv[2,$#]}" }
######################################################################
# autoloadされる関数を検索するパス
#fpath=(${HOME}/.zsh/functions/Completion ${HOME}/.zfunc ${fpath})
#fpath=(~/.zsh/completion $fpath)
fpath=(~/.zsh/plugins/zsh-completions/src $fpath)
######################################################################

######################################################################
# manマニュアルの設定されているディレクトリパス
manpath=($X11HOME/man /usr/man /usr/lang/man /usr/local/man /usr/share/man /usr/local/share/man /usr/X11R6/man /opt/man)
export MANPATH

######################################################################
# その他の環境変数の定義
export MAIL=/var/spool/mail/$USERNAME
######################################################################
# ヒストリ
HISTSIZE=10000  # メモリに展開する履歴数
SAVEHIST=10000  # 保存する履歴数
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
setopt autolist  # 補完候補を、自動でリストアップ(一覧表示)
setopt auto_cd  # ディレクトリ名のみで移動
setopt recexact
setopt longlistjobs  # ジョブリストにロングフォーマットを使用(jobs -l)
setopt autoresume  # ジョブの頭文字1文字のみでジョブの再実行を行う
setopt extended_history  # コマンドの実行時間もヒストリに記録
setopt histnostore  # historyコマンドをヒストリから除去
setopt histignorespace  # スペースで始まる行はヒストリに記録しない
setopt incappendhistory  # コマンド実行時にすぐにヒストリファイルに書き出す
setopt share_history  # 複数のzshセッションでヒストリをリアルタイムで共有
setopt hist_ignore_dups  # 直前のコマンドと同じ場合、履歴に残さない
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
#zmodload -a zsh/zprof zprof
zmodload -a zsh/mapfile mapfile
######################################################################
# Keybind configulation
# emacs like keybind
# (e.x. Ctrl-a gets to line head and Ctrl-e geto to end) and something additons

export EDITOR=nvim
bindkey -v  # -v : vi mode / -e : emacs mode

bindkey "^[[1~" beginning-of-line  # Home gets to line head
bindkey "^[[4~" end-of-line        # End gets to line end
bindkey "^[[3~" delete-char        # Del

# 矢印キーで単語移動
bindkey ";5C" forward-word
bindkey ";5D" backward-word
######################################################################
# autoload : シェル関数の自動読み込み
# -U : 関数内でaliasの展開をしない
# -z : zsh形式での読み込み
# 補完
# compinit : 補完機能を有効
# -u : 安全でないファイル／ディレクトリを使用
# -i : 安全でないファイル／ディレクトリを無視
# -c : セキュリティチェックをスキップ
#autoload -Uz compinit && compinit
autoload -Uz compinit && compinit -c

zstyle ':completion::complete:*' use-cache true
# 補完候補の一覧表示時、Tabや矢印で選択可能にする
zstyle ':completion:*:default' menu select=1
# 大文字、小文字を区別せず補完する
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
# 補完候補の色づけ
#export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

# kill の候補にも色付き表示
#zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([%0-9]#)*=0=01;31'

# コマンドにsudoを付けても補完
#zstyle ':completion:*:sudo:*' command-path /usr/local/sbin /usr/local/bin /usr/sbin /usr/bin /sbin /bin /usr/X11R6/bin

# 何も入力されていないときのTABでTABが挿入されるのを抑制
zstyle ':completion:*' insert-tab false
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
bindkey "^N" history-beginning-search-forward-end
bindkey "^P" history-beginning-search-backward-end
bindkey "\\ep" history-beginning-search-backward-end
bindkey "\\en" history-beginning-search-forward-end

# reverse menu completion binded to Shift-Tab
bindkey "\e[Z" reverse-menu-complete

autoload -Uz vcs_info
######################################################################
# Terminal configuration
#case "${TERM}" in
#screen)
#    TERM=xterm
#    ;;
#esac

#case "${TERM}" in
#xterm|xterm-color)
#    export LSCOLORS=exfxcxdxbxegedabagacad
#    export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
#    zstyle ':completion:*' list-colors 'di=34' 'ln=35' 'so=32' 'ex=31' 'bd=46;34' 'cd=43;34'
#    ;;
#kterm-color)
#    stty erase '^H'
#    export LSCOLORS=exfxcxdxbxegedabagacad
#    export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
#    zstyle ':completion:*' list-colors 'di=34' 'ln=35' 'so=32' 'ex=31' 'bd=46;34' 'cd=43;34'
#    ;;
#kterm)
#    stty erase '^H'
#    ;;
#cons25)
#    unset LANG
#    export LSCOLORS=ExFxCxdxBxegedabagacad
#    export LS_COLORS='di=01;34:ln=01;35:so=01;32:ex=01;31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
#    zstyle ':completion:*' list-colors 'di=;34;1' 'ln=;35;1' 'so=;32;1' 'ex=31;1' 'bd=46;34' 'cd=43;34'
#    ;;
#jfbterm-color)
#    export LSCOLORS=gxFxCxdxBxegedabagacad
#    export LS_COLORS='di=01;36:ln=01;35:so=01;32:ex=01;31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
#    zstyle ':completion:*' list-colors 'di=;36;1' 'ln=;35;1' 'so=;32;1' 'ex=31;1' 'bd=46;34' 'cd=43;34'
#    ;;
#esac

# ターミナルのタイトル(Set terminal title including current directory)
#case "${TERM}" in
#xterm-256color|xterm|xterm-color|kterm|kterm-color)
#     precmd() {
#         echo -ne "\033]0;${USER}@${HOST%%.*}:${PWD}\007"
#     }
#     ;;
#esac

# dircolors
#if [ -f ~/.dir_colors/dircolors ]
#  then eval `dircolors ~/.dir_colors/dircolors`
#fi
if [ -f ~/local/src/dircolors-solarized/dircolors.256dark ]
  then eval `dircolors ~/local/src/dircolors-solarized/dircolors.256dark`
fi

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
if (which zprof > /dev/null 2>&1) ;then
  zprof | less
fi


# 現在のブランチ名を表示
#PS1="$PS1"'$([ -n "$TMUX" ] && tmux setenv TMUXPWD_$(tmux display -p "#D" | tr -d %) "$PWD")'

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='rg --files --hidden --follow --glob "!.git/*"'
export FZF_CTRL_T_COMMAND='rg --files --hidden --follow --glob "!.git/*"'
export FZF_CTRL_T_OPTS='--preview "bat  --color=always --style=header,grid --line-range :100 {}"'

# ripgrepを利用
# 隠しファイルも対象
# .git配下を無視
# gitignoreに定義済みの対象を無視
# シンボリックリンクを追う
export FZF_DEFAULT_OPTS='--height 40% --reverse --border'

# cdrの設定
autoload -Uz is-at-least
if is-at-least 4.3.11
then
  autoload -Uz chpwd_recent_dirs cdr add-zsh-hook
  add-zsh-hook chpwd chpwd_recent_dirs
  zstyle ':chpwd:*'      recent-dirs-max 500
  zstyle ':chpwd:*'      recent-dirs-default yes
  zstyle ':completion:*' recent-dirs-insert both
fi

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

# denon completion
#. <(denon --completion)
autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /usr/local/bin/bitcomplete bit
fpath+=${ZDOTDIR:-~}/.zsh_functions

export PNPM_HOME="/home/kzmcond/.local/share/pnpm"
export PATH="$PNPM_HOME:$PATH"

# Bun
export BUN_INSTALL="/home/kzmcond/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# asdf
# append completions to fpath
fpath=(${ASDF_DIR}/completions $fpath)
# initialise completions with ZSH's compinit
autoload -Uz compinit && compinit

###########
# zcompile
###########
if [ ~/.zshrc -nt ~/.zshrc.zwc ]; then
  zcompile ~/.zshrc
fi

###############
# PATH重複回避
###############
#typeset -U PATH
typeset -U path cdpath fpath manpath
