# psの1行抜き
function psx {
    ps aux| head -1 && ps aux | grep $1 | sed -e '/grep/d'
};

# pgrep
function pgrp {
    pgrep -nl $1
};

# tree($1 : 階層  $2 : Directory)
function tree_l {
    tree -L $1 $2
};

# cdrecord(dummy) $1 : 5,0,0  $2 : sample.iso
function cdrec_dummy {
    sudo cdrecord -v -dummy dev=$1 $2
};

# cdrecord $1 : 5,0,0  $2 : sample.iso
function cdrec {
    sudo cdrecord -v dev=$1 $2
};

# Plymout Setup($1 : solar / fade-in / pulser / spinfinity / text)
function plymouth_set {
    sudo plymouth-set-default-plugin $1 && sudo /usr/libexec/plymouth/plymouth-update-initrd
};

# VBoxManage clonedh  $1 : old.vdi  $2 : new.vdi
function vboxclone {
    VBoxManage clonehd $1 $2
};

# yumdownloader($1-version.src.rpm)
function yum_dl_src {
    yumdownloader --source --destdir $HOME/Download $1
};

# fuser ($1 : directory)
function fuser_vm {
    sudo fuser -vm $1
};

function fuser_v {
    sudo fuser -v $1
};

# $1 : protcol(ex:tcp)  $2 : port(ex: 80 or http)
function fuser_n {
    sudo fuser -vn $1 $2
};

# 強制的にプロセスを終了($1 : directory)
function fuser_mk {
    sudo fuser -mk $1
};

# md5sum($1 : MD5SUMS)
function md5_ck {
    md5sum -c $1
};

# sha1sum($1 : SHA1SUMS)
function sha1_ck {
    sha1sum -c $1
};

# sha256sum($1 : SHA256SUMS)
function sha256_ck {
    sha256sum -c $1
};

# MTU($1 : eth0  $2 : 1500)
function edit_mtu {
    sudo ifconfig $1 mtu $2
};

# 2つのディレクトリで異なるファイルがないか調べる
function diff_dir {
    diff -brtBEq $1 $2
};

# 任意ディレクトリの容量調査
function ls_du {
    cd $1
    ls -la $1 | grep "^d" | awk '{print $9}' | du -h
    cd
};

# プロセス名からpidを割り出しkillする
function kill_from_name {
    ps aux| head -1 && ps aux | grep $1 | sed -e '/grep/d'
    kill `/sbin/pidof $1`
};

# Gem Document
function gemsrv {
    cd $HOME/code/$1
    gem server
    /usr/bin/chromium-browser 127.0.0.1:8808/
    cd
};

# gem-open
function gemop {
    gem open $1
}

# Gem Search
function gemsrc {
    vi `gem which $1`
}

# rails new hoge
function r_new {
    prj_dir="$HOME/code/rails/rails32"
    test -d $prj_dir || mkdir -p $prj_dir
    cd $prj_dir
    rvm use 1.9.3@rails32
    rails new $1 --skip-bundle
    cd $1
    bundle install --path vendor/bundle --binstubs
    echo rvm use 1.9.3@rails32 > $prj_dir/$1/.rvmrc
#    echo rvm use --create 1.9.3@$1 > $prj_dir/$1/.rvmrc
}

# show rvm prompt like "1.9.3-p125@gemset_name"
#function rvm_prompt {
#    result=`rvm-prompt v p g 2> /dev/null`
#    if [ "$result" ] ; then
#      echo "[$result]"
#    fi
#}

#
#function rvm_st {
#    rvm-prompt i v p g
#}

# sudo.vim
sudo() {
  local args
  case $1 in
    vi|vim)
      args=()
      for arg in $@[2,-1]
      do
        if [ $arg[1] = '-' ]; then
          args[$(( 1+$#args ))]=$arg
        else
          args[$(( 1+$#args ))]="sudo:$arg"
        fi
      done
      command vim $args
      ;;
    *)
      command sudo $@
      ;;
  esac
}

# youtube-dl
function movie-dl {
  cd Desktop
#  youtube-dl -tf 22 $1
  youtube-dl -t $1
  cd
}

# youtube-dl (mp3)
function mp3-dl {
  cd Desktop
  youtube-dl -t --extract-audio --audio-format=mp3 $1
  cd
}

# mkdir and cd
function mkdircd () {
  mkdir -p "$@" && eval cd "\"\$$#\"";
}

# gitignore.io  ex) gi node,nuxt > .gitignore
function gi() {
#  curl -L -s https://www.gitignore.io/api/$@ ;
  curl -sLw "\n" https://www.toptal.com/developers/gitignore/api/$@ > .gitignore ;
}

# hub
#function git() {
#  hub "$@"
#}

# open command
function open() {
  xdg-open $@ &
}

# wttr
function wttr() {
  location=${1:-西条市}
  curl ja.wttr.in/$location
}

# todoist find project
function peco-todoist-project () {
    local SELECTED_PROJECT="$(todoist projects | peco | head -n1 | cut -d ' ' -f 1)"
    if [ -n "$SELECTED_PROJECT" ]; then
        if [ -n "$LBUFFER" ]; then
            local new_left="${LBUFFER%\ } $SELECTED_PROJECT"
        else
            local new_left="$SELECTED_PROJECT"
        fi
        BUFFER=${new_left}${RBUFFER}
        CURSOR=${#new_left}
    fi
}
zle -N peco-todoist-project
bindkey "^xtp" peco-todoist-project

# {{{ todoist find labels
function peco-todoist-labels () {
    local SELECTED_LABELS="$(todoist labels | peco | cut -d ' ' -f 1 | tr '\n' ',' | sed -e 's/,$//')"
    if [ -n "$SELECTED_LABELS" ]; then
        if [ -n "$LBUFFER" ]; then
            local new_left="${LBUFFER%\ } $SELECTED_LABELS"
        else
            local new_left="$SELECTED_LABELS"
        fi
        BUFFER=${new_left}${RBUFFER}
        CURSOR=${#new_left}
    fi
}
zle -N peco-todoist-labels
bindkey "^xtl" peco-todoist-labels

# todoist close
function peco-todoist-close() {
    local SELECTED_ITEMS="$(todoist list | peco | cut -d ' ' -f 1 | tr '\n' ' ')"
    if [ -n "$SELECTED_ITEMS" ]; then
        BUFFER="todoist close $(echo "$SELECTED_ITEMS" | tr '\n' ' ')"
        CURSOR=$#BUFFER
    fi
    zle accept-line
}
zle -N peco-todoist-close
bindkey "^xtc" peco-todoist-close
# }}}

# {{{ ghq - peco
function peco-src() {
	local src=$(ghq list --full-path|peco --query "$LBUFFER")
	if [ -n "$src" ]; then
		BUFFER="cd $src"
#		zle accept-line
#    code .
	fi
#	zle -R -c
  zle clear-screen
}
zle -N peco-src
#bindkey '^]' peco-src
#bindkey '^[' peco-src
bindkey '^g' peco-src
# }}}

# {{{ ghq-peco
function ghq-peco {
  local dir="$( ghq list -p | peco )"
  if [ ! -z "$dir" ] ; then
    cd "$dir"
    code .
#    zle reset-prompt
  fi
#  zle clear-screen
#  zle -R -c
}
zle -N ghq-peco
#bindkey '^[' ghq-peco
bindkey '^h' ghq-peco
# }}}

# {{{ Todoist + Toggl
function toggl-start-todoist () {
  local selected_item_id=`todoist --project-namespace --namespace list | peco | cut -d ' ' -f 1`
  if [ ! -n "$selected_item_id" ]; then
    return 0
  fi
  local selected_item_content=`todoist --csv show ${selected_item_id} | grep Content | cut -d',' -f2- | sed s/\"//g`
  if [ -n "$selected_item_content" ]; then
    BUFFER="toggl start \"${selected_item_content}\""
    CURSOR=$#BUFFER
else
    zle accept-line
  fi
}
zle -N toggl-start-todoist
bindkey '^xts' toggl-start-todoist
# }}}

# pigz
# x : extract  c : compress  v : verbose  z : gz  J : xz  j : bzip2
function targz(){tar xvf $@ --use-compress-prog=pigz }
function tarxz(){tar xvf $@ --use-compress-prog=pixz }
function tarbzip2(){tar xvf $@ --use-compress-prog=pbzip2 }

# clamav
function clamscan_full {
    local VIRUS_DIR="/var/log/clamav/virus"

    if [ ! -d $VIRUS_DIR ]; then
      sudo mkdir -p $VIRUS_DIR
      sudo chown clamav:clamav $VIRUS_DIR
      sudo chmod 640 $VIRUS_DIR
    fi

    date
    sudo clamscan $1 \
      --infected \
      --recursive \
      --log=/var/log/clamav/clamscan.log \
      --move=$VIRUS_DIR \
      --exclude-dir=^/sys \
      --exclude-dir=^/proc \
      --exclude-dir=^/dev \
      --exclude-dir=^/var/log/clamav/virus

# --infected        : 感染を検出したファイルのみを結果に出力
# --recursive       : 指定ディレクトリ以下を再帰的に検査(圧縮ファイルは解凍して検査)
# --log=FILE        : ログファイル
# --move=DIR        : 感染を検出したファイルの隔離先
# --remove          : 感染を検出したファイルを削除
# --exclude=FILE    : 検査除外ファイル(パターンで指定)
# --exclude-dir=DIR : 検査除外ディレクトリ(パターンで指定)

    if [ $? = 0 ]; then
      echo "ウイルス未検出."
      # cat /var/log/clamav/clamscan.log | mail -s "Clamav scan OK." kzmcond@localhost
    else
      echo "ウイルス検出!!"
      cat /var/log/clamav/clamscan.log | mail -s "Clamav scan NG!" kzmcond@localhost
    fi
};

function clamscan_home {
    local VIRUS_DIR="/var/log/clamav/virus"
    local LOG_FILE="/var/log/clamav/clamscan.log"
    sudo sh -c "echo '#####################' >> $LOG_FILE"
    sudo sh -c "echo $(date)  $HOME/$1 >> $LOG_FILE"

    if [ ! -d $VIRUS_DIR ]; then
      sudo mkdir -p $VIRUS_DIR
      sudo chown clamav:clamav $VIRUS_DIR
      sudo chmod 640 $VIRUS_DIR
    fi

    date
    sudo clamscan $HOME/$1 \
      --infected \
      --recursive \
      --log=/var/log/clamav/clamscan.log \
      --move=$VIRUS_DIR \
      --exclude-dir=^/var/log/clamav/virus

# --infected        : 感染を検出したファイルのみを結果に出力
# --recursive       : 指定ディレクトリ以下を再帰的に検査(圧縮ファイルは解凍して検査)
# --log=FILE        : ログファイル
# --move=DIR        : 感染を検出したファイルの隔離先
# --remove          : 感染を検出したファイルを削除
# --exclude=FILE    : 検査除外ファイル(パターンで指定)
# --exclude-dir=DIR : 検査除外ディレクトリ(パターンで指定)

    if [ $? = 0 ]; then
      echo "ウイルス未検出."
      # cat /var/log/clamav/clamscan.log | mail -s "Clamav scan OK." kzmcond@localhost
    else
      echo "ウイルス検出!!"
      cat /var/log/clamav/clamscan.log | mail -s "Clamav scan NG!" kzmcond@localhost
    fi
};

# Rust
function cargo_new {
    cargo new $1 --bin --vcs git
}

# ESLint & Prettier
function lint-fmt {
    if [ $# = 0 ]; then
        echo "スクリプト名を指定してね"
    else
        echo " ### ESLint ###"
        npx eslint --cache --fix $1
        if [ $? = 0 ]; then
            echo " ### Prettier ###"
            npx prettier --write $1
        fi
    fi
}

# PATH
path_append ()  { path_remove $1; export PATH="$PATH:$1"; }
path_prepend () { path_remove $1; export PATH="$1:$PATH"; }
path_remove ()  { export PATH=`echo -n $PATH | awk -v RS=: -v ORS=: '$0 != "'$1'"' | sed 's/:$//'`; }

# SSH切断時にデフォルトに戻す
#function cssh() {ssh $*;tmux select-pane -P 'fg=default,bg=default'}

# fzf
## gitで一発でremoteよりcheckout
fbrr() {
  local branches branch
  branches=$(git for-each-ref --count=30 --sort=-committerdate refs/heads/ --format="%(refname:short)") &&
  branch=$(echo "$branches" |
           fzf-tmux -d $(( 2 + $(wc -l <<< "$branches") )) +m) &&
  git checkout $(echo "$branch" | sed "s/.* //" | sed "s#remotes/[^/]*/##")
}

## fbr - checkout git branch
fbr() {
  local branches branch
  branches=$(git branch -vv) &&
  branch=$(echo "$branches" | fzf +m) &&
  git checkout $(echo "$branch" | awk '{print $1}' | sed "s/.* //")
}
## fbrm - checkout git branch (including remote branches)
fbrm() {
  local branches branch
  branches=$(git branch --all | grep -v HEAD) &&
  branch=$(echo "$branches" |
           fzf-tmux -d $(( 2 + $(wc -l <<< "$branches") )) +m) &&
  git checkout $(echo "$branch" | sed "s/.* //" | sed "s#remotes/[^/]*/##")
}
## fshow - git commit browser
fshow() {
  git log --graph --color=always \
      --format="%C(auto)%h%d %s %C(black)%C(bold)%cr" "$@" |
  fzf --ansi --no-sort --reverse --tiebreak=index --bind=ctrl-s:toggle-sort \
      --bind "ctrl-m:execute:
                (grep -o '[a-f0-9]\{7\}' | head -1 |
                xargs -I % sh -c 'git show --color=always % | less -R') << 'FZF-EOF'
                {}
FZF-EOF"
}
## fcd - cd to selected directory
fcd() {
  local dir
  dir=$(find ${1:-.} -path '*/\.*' -prune \
                  -o -type d -print 2> /dev/null | fzf +m) &&
  cd "$dir"
}
# worktree移動
#function cdworktree() {
#    # カレントディレクトリがGitリポジトリ上かどうか
#    git rev-parse &>/dev/null
#    if [ $? -ne 0 ]; then
#        echo fatal: Not a git repository.
#        return fi
#
#    local selectedWorkTreeDir=`git worktree list | fzf | awk '{print $1}'`
#
#    if [ "$selectedWorkTreeDir" = "" ]; then
#        # Ctrl-C.
#        return
#    fi
#
#    cd ${selectedWorkTreeDir}
#}
# ghq + fzf
function ghq-fzf() {
  local src=$(ghq list --full-path | fzf --preview "ls -laTp $(ghq root)/{} | tail -n+4 | awk '{print \$9\"/\"\$6\"/\"\$7 \" \" \$10}'")
#  local src=$(ghq list | fzf --preview "ls -laTp $(ghq root)/{} | tail -n+4 | awk '{print \$9\"/\"\$6\"/\"\$7 \" \" \$10}'")
  if [ -n "$src" ]; then
    BUFFER="cd $src"
#    BUFFER="cd $(ghq root)/$src"
    zle accept-line
  fi
  zle -R -c
}
zle -N ghq-fzf
bindkey '^]' ghq-fzf
# vi fzf
function vi_fzf() {
  vi `find $1 -type f |fzf -m`
}
# fzf-cdr
function fzf-cdr() {
    target_dir=`cdr -l | sed 's/^[^ ][^ ]*  *//' | fzf`
    target_dir=`echo ${target_dir/\~/$HOME}`
    if [ -n "$target_dir" ]; then
        cd $target_dir
    fi
}
# fgを使わずctrl+zで行ったり来たりする
fancy-ctrl-z () {
  if [[ $#BUFFER -eq 0 ]]; then
    BUFFER="fg"
    zle accept-line
  else
    zle push-input
    zle clear-screen
  fi
}
zle -N fancy-ctrl-z
bindkey '^Z' fancy-ctrl-z
# fgをfzfで
alias fgg='_fgg'
function _fgg() {
  wc=$(jobs | wc -l | tr -d ' ')
  if [ $wc -ne 0 ]; then
    job=$(jobs | awk -F "suspended" "{print $1 $2}"|sed -e "s/\-//g" -e "s/\+//g" -e "s/\[//g" -e "s/\]//g" | grep -v pwd | fzf | awk "{print $1}")
    wc_grep=$(echo $job | grep -v grep | grep 'suspended')
    if [ "$wc_grep" != "" ]; then
      fg %$job
    fi
  fi
}
# agの結果をfzfで絞り込み選択するとvimで開く
alias agg="_agAndVim"
function _agAndVim() {
    if [ -z "$1" ]; then
        echo 'Usage: agg PATTERN'
        return 0
    fi
    result=`ag $1 | fzf`
    line=`echo "$result" | awk -F ':' '{print $2}'`
    file=`echo "$result" | awk -F ':' '{print $1}'`
    if [ -n "$file" ]; then
        vim $file +$line
    fi
}

# ddeno () {
#   docker run \
#     --interactive \
#     --tty \
#     --rm \
#     --volume $PWD:/app \
#     --volume $HOME/.deno:/deno-dir \
#     --workdir /app \
#     hayd/alpine-deno:1.1.1 \
#     "$@"
# }

function fd-fzf() {
  local target_dir=$(fd -t d -I -H -E ".git"| fzf-tmux --reverse --query="$LBUFFER")
  local current_dir=$(pwd)

  if [ -n "$target_dir" ]; then
    BUFFER="cd ${current_dir}/${target_dir}"
    zle accept-line
  fi

  zle reset-prompt
}
zle -N fd-fzf
bindkey "^n" fd-fzf

# PDFサイズ縮小(pdfmin *.pdf)
function pdfmin()
{
    local cnt=0
    for i in $@; do
        /usr/bin/gs -sDEVICE=pdfwrite \
           -dCompatibilityLevel=1.4 \
           -dPDFSETTINGS=/ebook \
           -dNOPAUSE -dQUIET -dBATCH \
           -sOutputFile=${i%%.*}.min.pdf ${i} &
        (( (cnt += 1) % 4 == 0 )) && wait
    done
    wait && return 0
}

########
# React
########
#######
# Vite
#######
function nvv {
    npm init vite@latest $1 -- --template vanilla
}
function yvv {
    yarn create vite $1 --template vanilla
}
function nvvt {
    npm init vite@latest $1 -- --template vanilla-ts
}
function yvvt {
    yarn create vite $1 --template vanilla-ts
}
function nvrt {
    npm init vite@latest $1 -- --template react-ts
}
function yvrt {
    yarn create vite $1 --template react-ts
}
function nvpt {
    npm init vite@latest $1 -- --template preact-ts
}
function yvpt {
    yarn create vite $1 --template preact-ts
}
function nvst {
    npm init vite@latest $1 -- --template svelte-ts
}
function yvst {
    yarn create vite $1 --template svelte-ts
}

# ghq --> peco
#function gp {
#    cd $(ghq list --full-path | peco)
#}

# 役に立たないコマンド
function snow_rb {
    ruby -e 'C=`stty size`.scan(/\d+/)[1].to_i;S=["2743".to_i(16)].pack("U*");a={};puts "\033[2J";loop{a[rand(C)]=0;a.each{|x,o|;a[x]+=1;print "\033[#{o};#{x}H \033[#{a[x]};#{x}H#{S} \033[0;0H"};$stdout.flush;sleep 0.1}'
}
function emoji_rb {
    ruby -e 'C=`stty size`.scan(/\d+/)[1].to_i;S=[*0x1F600..0x1F640];a={};puts "\033[2J";loop{a[rand(C)]=0;a.each{|x,o|;a[x]+=1;print "\033[#{o};#{x}H \033[#{a[x]};#{x}H#{S.sample.chr("utf-8")} \033[0;0H"};$stdout.flush;sleep 0.2}'
}

# 自動検索
alias chrome-beta="/home/kzmcond/Desktop/google-chrome-beta.desktop"
s() {
  url='https://google.co.jp/search?q='
  for t;
  do
    url="${url}${t}+"
  done
  echo $url
  chrome-beta $url &
}

function de {
  docker exec -it $1 /bin/bash
}

function mrl {
  docker exec -it $1 mysql -uroot -p$2
}

#function lsdns {
#  systemd-resolve --status | grep enp4s0 -A3
#  echo ''
#  systemd-resolve --status | grep wlp2s0 -A3
#}

function status_network {
  systemctl status NetworkManager
  echo ''
  systemctl status systemd-networkd
  echo ''
  systemctl status systemd-resolved
}

# youtube-dl
function ydlf {
  yt-dlp -F $1 | grep -v only
#  youtube-dl -F $1 | grep -v only
}

function ytdl {
  cd $HOME/Videos
  yt-dlp -f $1 $2
#  youtube-dl -f $1 $2
#  youtube-dl -f "bestvideo[ext=mp4]+bestaudio[ext=m4a]/best[ext=mp4]/best" $1
}

# 設定が残存を一括で削除
function rm-rc {
  sudo apt-get purge $(dpkg -l | grep '^rc' | awk '{print $2}')
}
