alias where='command -v'

alias vi='/usr/bin/vim'
#alias nvi='/usr/bin/nvim'
alias nvi='$HOME/local/bin/nvim'
alias nv='$HOME/local/bin/nvim -u $HOME/.config/nvim/my-init.vim'
#alias vi='/usr/bin/flatpak run --branch=stable --arch=x86_64 --command=nvim-wrapper io.neovim.nvim'
#alias nvim='/usr/bin/flatpak run --branch=stable --arch=x86_64 --command=nvim-wrapper io.neovim.nvim'
alias vz="vi $HOME/.zshrc"
alias vzp="vi $HOME/.zpreztorc"
alias sz="source $HOME/.zshrc"
alias va="vi $HOME/.zsh/alias.zsh"
alias vf="vi $HOME/.zsh/func.zsh"
alias vp="vi $HOME/.zsh/prompt.zsh"
alias vn="vi $HOME/.config/nvim/init.vim"
alias vt="vi $HOME/.tmux.conf"
alias via="vi $HOME/.config/alacritty/alacritty.yml"
alias vor="vi $HOME/.config/openbox/rc.xml"
alias vom="vi $HOME/.config/openbox/menu.xml"
alias voa="vi $HOME/.config/openbox/autostart"
alias cor="cat $HOME/.config/openbox/rc.xml"
alias com="cat $HOME/.config/openbox/menu.xml"
alias coa="cat $HOME/.config/openbox/autostart"
alias vimdiff="vi -d"
alias mv='nocorrect mv'
alias cp='nocorrect cp'
alias mkdir='nocorrect mkdir'
alias font_list='fc-list : family style'
alias clr='clear'
alias cl='clear'
alias :q='exit'

alias pd='popd'

alias lsver='cat /etc/os-release |grep VERSION= | sed -e s/VERSION=\"//g | sed -e s/\"$//g
'

# Mozc設定画面
alias mozc_tool='/usr/lib/mozc/mozc_tool --mode=config_dialog'

alias j='jobs -l'
#alias h=history

alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

case "${OSTYPE}" in
freebsd*|darwin*)
    alias ls="ls -G -w"
    ;;
linux*)
    alias ls="ls --color=auto"
    ;;
esac

alias ls='ls --color=auto'
alias la='ls -a'
alias ll='ls -l'
alias lla='ls -la'
alias lsrt='ls -rt'
alias llrt='ls -lrt'
alias lart='ls -art'
alias llart='ls -lart'
alias llsym='ls -la |grep ^l'

alias lf='ls -F --color=auto'
alias lsi='ls -i --color=auto'
alias lsln="ls -la | grep lrwx | cut -d' ' -f 13-15"
#alias l='ls -CF'
#alias dir='ls --color=auto --format=vertical'
#alias vdir='ls --color=auto --format=long'
#alias ls='ls --color'

alias lv='lv -c'

# ディレクトリとディレクトリのシンボリックリンクのみ表示
alias lsdn='ls -ld *(-/DN)'

# "."で始まるファイルのみ表示
alias lsa='ls -ld .*'

#alias less='less -N'

alias du='du -h'
alias df='df -h'
alias dft='df -Th'
alias free='free -m'

alias su="su -l"

alias conv='convmv -r -f shiftjis -t utf8 * --notest'

alias dmesg='dmesg | less'
#alias terminator='terminator -fb &'

#alias server_name='ssh -v -l USERNAME IP ADDRESS'
#alias rm='rm -i'
#alias emenu='aterm nano -e ~/.e16/menus/user_apps'

#alias aptar='sudo apt-get autoremove'  #Ubuntu

alias ssh_dd-wrt='ssh -oKexAlgorithms=+diffie-hellman-group1-sha1 root@192.168.1.10'
alias google_key='wget https://dl-ssl.google.com/linux/linux_signing_key.pub && sudo rpm --import linux_signing_key.pub'  # Google Public Key
#alias astart='cd ~/GNUstep/Library/AfterStep/start'

#alias menulst='sudo vi /boot/grub/menu.lst'
#alias reboot='sudo reboot'
alias gterm='/bin/sh -c "VTE_CJK_WIDTH=1 gnome-terminal --disable-factory" &'
#alias gterm='/usr/bin/gnome-terminal &'
alias ps_aux='ps aux | grep -v grep | grep '

alias cd_trash='cd ~/.local/share/Trash/files'
alias cd_dta='cd ~/Download/dta'
alias cd_xorg='cd /etc/X11'
alias cd_bootchart='cd /var/log/bootchart'
alias cd_ss='cd /usr/share/gnome-screensaver'
alias vi_wp="vi ~/.gconf/desktop/gnome/background/%gconf.xml"

alias visudo='sudo vi /etc/sudoers'
alias suvi='sudoedit'
alias suge='sudo gedit'

# 不要なパッケージを表示
alias pc-leaves='sudo package-cleanup --leaves'
#
alias lsdir='ls -l | grep ^d'

alias vmconf='sudo vmware-config.pl' # VmWare Server Reconfigure
alias vbconf='sudo /etc/init.d/vboxdrv setup' # VirtualBox Reconfigure

alias htags='htags -ansx' # GNU Global(a : alpaabet  n : line-number  s : symbol  x : xhtml)

# DVD Burn
alias cdrec_scan='cdrecord -scanbus'

# netstat
alias netstat_ntu='netstat -ntu'
alias netstat_nltu='netstat -nltu'

# ps e : all  f : full  w : wrap
alias ps_efw='ps -efw'

# ps(Memory Usage : RSS) a : 端末を持つ全プロセス x : 全プロセス  l : long
#alias ps_ram='ps alxwO r | awk '{ print $3"\t"$8"\t"$13 }''
# pid
alias ls_pid='ls /var/run/*.pid'
alias ll_pid='ls -l /var/run/*.pid'

alias fuser='sudo fuser'
alias route='sudo route -CFvnee'
# memory cache
alias drop_cache='sudo sysctl -w vm.drop_caches=1'

# access_logでphpを含みjpgとpngを含まない
# fgrep : grep -F 改行で区切られた文字列リストとして扱う
# egrep : grep -E 正規表現
# -v    : マッチしない
alias tail_access_log='sudo tail -f /var/log/httpd/access_log | fgrep php | egrep -v "jpg|png"'

# Figlet
alias figlet='/usr/bin/figlet'

# local mail
alias localmail='vi /var/mail/kzmcond'

# tail
alias tail_msg='sudo tail -f /var/log/messages'
alias tailf='less -F'

# sysstat(pidstat)
alias pidstat='sudo pidstat -d'

# Apache Modules
#alias httpd_m='sudo httpd -M'
#alias httpd_l='sudo httpd -l'

# Apache2(Ubuntu)
#alias cd_apache2conf='cd /etc/apache2'
#alias vi_apache2conf='sudo vi /etc/apache2/apache2.conf'
#alias lv_acc_log='sudo lv /var/log/apache2/access.log'
#alias lv_err_log='sudo lv /var/log/apache2/error.log'
#alias vi_apache2enable='sudo vi /etc/apache2/sites-enabled/000-default'
#alias vi_apache2avail='sudo vi /etc/apache2/sites-available/default'
#alias apache2_restart='sudo /etc/init.d/apache2 restart'

# Passenger
alias passenger-status='sudo passenger-status'

# Wake on Lan
#alias wol_845E='wakeonlan -f ~/bin/wol/845E.wol'

# Kernel Param
alias sysctl='sudo sysctl -a'

# Screen
#alias scr_prof='screen-profiles'

alias make='make -j 8'

# Ruby
alias ruby="$HOME/local/ruby/bin/ruby"
alias gem="$HOME/local/ruby/bin/gem"
alias ri="$HOME/local/ruby/bin/ri"
alias bundle="$HOME/local/ruby/bin/bundle"
alias rake="$HOME/local/ruby/bin/rake"
alias rdoc="$HOME/local/ruby/bin/rdoc"
alias erb="$HOME/local/ruby/bin/erb"
alias irb="$HOME/local/ruby/bin/irb"
alias racc="$HOME/local/ruby/bin/racc"
alias racc2y="$HOME/local/ruby/bin/racc2y"
alias y2racc="$HOME/local/ruby/bin/y2racc"
alias bundler="$HOME/local/ruby/bin/bundler"

#alias rbe='rbenv'
#alias re='rbenv exec'
alias be='bundle exec'
#alias bi='bundle install --path vendor/bundle'
alias bi='bundle install -j 8 --path vendor/bundle'
alias bck='bundle check'
alias bo='bundle open'
alias bs='bundle show'
alias bcl='bundle clean'
alias bconf='bundle config'
alias bini='bundle init'
alias bcl='bundle clean'
#alias r='rails'
alias r='bundle exec rails'
alias rnew='bundle exec rails -T --skip-bundle'
alias r_dm='rake db:migrate'
alias gem_srv='gem server'

alias r_da='rake doc:app'
alias r_dr='rake doc:rails'
alias r_dp='rake doc:plugins'
alias r_dra='rake doc:reapp'
alias r_drr='rake doc:rerails'

alias mongo_start="sudo /usr/local/mongodb/bin/mongod --dbpath /var/db/mongo"

alias show_gemdoc='chromium-browser http://localhost:8808'
alias railsdoc='chromium-browser /usr/lib/ruby/gems/1.8/doc/actionpack-2.3.2/rdoc/index.html'
alias railsdoc_r='chromium-browser http://api.rubyonrails.org/'
alias rubydoc_r='chromium-browser http://www.ruby-lang.org/ja/man/html/index.html'
alias webrick="ruby -rwebrick -e 'WEBrick::HTTPServer.new({:DocumentRoot => \"./\", :Port => 3000}).start'"
alias ruby-ref='ruby /home/kzmcond/Documents/Ref/Ruby/ruby-refm/server.rb'
alias ruby-ref-browse='/usr/bin/chromium-browser http://localhost:10080/ &'
alias spec='spec -c'
alias gemdoc='`gem env gemdir`/doc'
alias cd_gemdoc='cd `gem env gemdir`/doc'

alias rurema_s='rurema --server --browser'

alias rs="bundle exec rspec"

# Git
alias g='git'
#alias git="$HOME/bin/git"
#alias git_show='git show | lv'
#alias git_diff='git diff | lv'
alias gst='git status '
alias gsts='git status -s'
alias ga='git add '
alias gb='git branch '
alias gc='git commit'
alias gd='git diff'
alias gco='git checkout '
alias gk='gitk --all&'
#alias gx='gitx --all' # only mac os x
alias gdc='git diff --color-words'
alias gss='git status --short --branch'
alias glg='git log --graph --decorate --oneline'
alias glga='git log --all --graph --decorate --oneline'
alias glgag='git log --all --graph --decorate'
alias glp='git log -p'
alias lg='lazygit'
alias gsw='git switch'
alias gres='git restore'
alias gcd1='git clone --depth 1 '

#alias got='git '
#alias get='git '

alias h='heroku'

# Docker
alias d='docker'
alias docker-purge='docker stop $(docker ps -q) && docker rmi $(docker images -q) -f'
alias docker-stop='docker stop $(docker ps -q)'
alias docker-rm='docker rm -vf $(docker ps -q -a)'
alias docker-rmi='docker rmi $(docker images -q)'
alias ddeno="docker run --rm -it --init -v $PWD:/app hayd/alpine-deno"
alias ddenoi="docker run --rm -it --init -p 9229:9229 -v $PWD:/app hayd/alpine-deno run --inspect-brk=0.0.0.0:9229"
alias dsp="docker system prune -a"
#alias dc='docker compose'
alias dcom='docker compose'
alias dnet='docker network ls'
alias dps='docker ps'
alias dpsa='docker ps -a'
alias dcps='docker compose ps'
alias dcpsa='docker compose ps -a'
alias dci='docker compose images'
alias dvls='docker volume ls'
alias dnls='docker network ls'
alias dcu='docker compose up -d'
alias dcub='docker compose up -d --build'
alias dcd='docker compose down --rmi all --remove-orphans'
alias dcs='docker compose start'
alias dct='docker compose stop'
alias dnp='docker network prune'

# Mozilla
#alias fx='sh /home/kzmcond/bin/mozilla/fx35.sh'
#alias tb='sh /home/kzmcond/bin/mozilla/tb3b2.sh'
#alias fx1='/home/kzmcond/firefox/firefox'
#alias fftr='/home/kzmcond/firefox/firefox http://www.techrepublic.com'

alias vipw='sudo vipw'
alias vigr='sudo vigr'
alias visudo='sudo visudo'

# VBoxManage
alias vbm='/usr/bin/VBoxManage'
alias strvm_sv1='VBoxManage startvm "Srv1" --type headless'
alias strvm_ubusv='VBoxManage startvm "Ubuntu_Svr" --type headless'
alias endvm_sv1='VBoxManage controlvm "Srv1" poweroff'
alias endvm_ubusv='VBoxManage controlvm "Ubuntu_Svr" poweroff'
alias vbox_centos_start='/usr/bin/VBoxManage startvm CentOS5-Base --type headless'
alias vbox_mini_start='vboxmanage startvm "mini" --type headless'
alias vbox_mini_stop='vboxmanage controlvm "mini" acpipowerbutton'
alias vbox_list_vms='vboxmanage list vms'
alias vbox_list_running_vms='vboxmanage list runningvms'

alias gd='dirs -v; echo -n "select number: "; read newdir; cd -"$newdir"'

alias conky_reload='killall -SIGUSR1 conky'
alias get_gem_list_path="ruby -e 'puts $:'"

#alias web='/usr/bin/chromium-browser'
#alias chromium='/usr/bin/chromium-browser'
alias vim73patche='ftp://ftp.vim.org/pub/vim/patches/7.3/'

alias clamscan='/usr/bin/clamscan -v'
alias cs='/usr/bin/clamscan -v'
alias csall='/usr/bin/clamscan -v *'

# golang
alias gor='go run'
alias gob='go build'

#alias tmux="TERM=xterm-256color tmux"
#alias mux="tmuxinator"

# tmux
alias t='tmux'
alias tmux='/usr/bin/tmux -2u'
alias tmux_ls='/usr/bin/tmux -2u ls'
alias tmux_kill-server='/usr/bin/tmux -2u kill-server'
alias tmuxg='tmux new-session \; source-file ~/.tmux.session.conf'
alias tmuxs='tmux new-session \; source-file ~/.tmux.startup'

# open command
alias o='open'
alias op='open'

alias dia='emacs ~/diary/$(date "+%Y/%m/%d.md")'

# Todoist
alias todoist="$HOME/.golang/bin/todoist --color"
#
alias tl='todoist --project-namespace --namespace --color list'
# Toggl
alias toggl="$HOME/.golang/bin/toggl"
alias tge='toggl stop'

# pip
#alias piplist='pip list --format=columns'
alias pipoutdated='pip list --outdated --format=columns'

# tenki.pl
alias tenki="$HOME/bin/tenki.pl --pws=I3085"

# ip address
alias gip='wget -q -O- icanhazip.com'

#alias taskshell='ZDOTDIR=~/.task zsh'

# aria2
# -x10 : 同時接続コネクション数
# -s10 : 複数サーバへの並列接続時に指定するコネクション数
# -k1M : 分散ダウンロード時のブロックサイズ(Default : 20MB)
# (URL) : 同じファイルが配置されている複数URL
alias aria2c='aria2c -x10 -s10 -k1M '

# apt-fast
alias install='sudo apt-fast update && sudo apt-fast install'
alias upgrade='sudo apt-fast update && sudo apt-fast upgrade'

# weather
alias wether='curl wttr.in/saijo'
alias wether_ja='curl wttr.in/saijo?lang=ja'

# fzf
alias cdd='fzf-cdr'
# git checkout branchをfzfで選択
alias co='git checkout $(git branch -a | tr -d " " |fzf --height 100% --prompt "CHECKOUT BRANCH>" --preview "git log --color=always {}" | head -n 1 | sed -e "s/^\*\s*//g" | perl -pe "s/remotes\/origin\///g")'

# System
alias upd="$HOME/local/bin/update.sh"

# Homebrew
alias b="brew"

# Python
alias python="$HOME/local/python/bin/python"
alias pip="$HOME/local/python/bin/pip"
alias idle="$HOME/local/python/bin/idle"
alias pydoc="$HOME/local/python/bin/pydoc"

# Node.js
alias v='volta'
alias n='npm'
alias p='pnpm'
alias px='pnpx'
alias nr='npm run'
alias nrs='npm run --silent'
#alias tree_npm='tree -L 3 -I ".git|node_modules" -a'
alias tree_npm='tree -I ".git|node_modules" -a'
alias tree_node='tree . -a -I ".git|node_modules|.history"'
alias y='yarn'
alias yr='yarn run'
alias yrs='yarn run --silent'
alias lint='npx eslint --cache --fix'
alias fmt='npx prettier --write'
alias fast='fast-cli -u --single-line'

# Deno
alias dr='deno run'
alias drw='deno run --watch'
alias dl='deno lint --unstable'

# TypeScript
alias nrt='npm run ts-node'
alias nrd='npm run ts-node-dev'

# Svelte
alias create-svelte-app='npx degit sveltejs/template '
alias csa='npx degit sveltejs/template '

# Rust
alias cr='cargo run'
alias cb='cargo build'
alias cat='$HOME/.cargo/bin/bat'
alias ls='$HOME/.cargo/bin/exa'
#alias find='$HOME/.cargo/bin/fd'
alias llrt='$HOME/.cargo/bin/exa -lsnew'
alias llrta='$HOME/.cargo/bin/exa -lasnew'

# ide (tmux)
alias ide='$HOME/local/bin/ide.sh'
alias pane='$HOME/local/bin/pane.sh'

# ghq --> peco
alias gp='cd $(ghq list --full-path | peco)'
alias ghprco='gh pr checkout $(gh pr list | peco | cut -f 1)'
alias gf='cd $(ghq root)/$(ghq list | fzf --reverse)'
alias gff='cd $(ghq list --full-path | fzf --reverse)'
alias ggs='ghq get --shallow '

######
# RPM
# ####
#alias rh_ver='cat /etc/redhat-release'
#alias yumck='sudo yum check-update'  #Fedora
#alias yumup='sudo yum update'  #Fedora
#alias yumca='sudo yum clean all'  #Fedora
#alias brpm='rpm -ivh ~/RPM/*rpm'
######################################################################
# グローバルエイリアス
alias -g M='|more'
alias -g H='|head'
alias -g T='|tail'
alias -g G='|grep'
alias -g GI='|grep -i'
######################################################################
alias -s log=cat
#alias -s c=vim
#alias -s h=vim
#alias -s cpp=vim
#alias -s sh=vim
alias -s txt=less
alias -s xml=less
alias -s rb=vim

alias hibernate='/usr/sbin/pm-hibernate'

# macOSのpbcopy / pbpaste をxclipで実現
alias pbcopy='xclip -selection c'
alias pbpaste='xclip -selection c -o'

# vite
#alias nv='npm init vite@latest'
alias yv='yarn create vite'
alias pv='pnpm create vite'

# wifi
alias wifi_on='nmcli radio wifi on'
alias wifi_off='nmcli radio wifi off'

# zellij
alias ze='zellij'

# wezterm
alias wezterm='flatpak run org.wezfurlong.wezterm'

# DNS
#alias lsdns='systemd-resolve --status | grep "DNS Servers" -A2'
#alias lsdns='systemd-resolve --status | grep "Current DNS Server" -A2'
alias lsdns='systemd-resolve --status'
alias edit_dns='suvi /etc/systemd/resolved.conf'
alias restart_dns='sudo systemctl restart systemd-resolved'

# Flatpak
alias vlc='flatpak run org.videolan.VLC'

# Rome
alias rf='npx rome format --quote-style single --write '
alias rl='npx rome check '

# youtube-dl
alias yd='youtube-dl'

# ffmpeg
alias mkv2mp4="for f in ./**/*.mkv; do ffmpeg -n -i \"\$f\" -c copy \"\${f%.mkv}.mp4\" && rm \"\$f\"; done"

