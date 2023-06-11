# プロンプトに色を付ける
autoload -Uz colors && colors
######################################################################
# プロンプトの設定
# PROMPT : 通常 / PROMPT2 : 複数行(for, while) / SPROMPT : 入力ミス確認 
#PROMPT='%m%# '
#PROMPT="%m%# %{${fg[blue]}%} %~ %{${fg[green]}%}%# %{${fg[white]}%"

#USER_NAME=`whoami`

local BLACK=$'%{\e[1;30m%}'
local RED=$'%{\e[1;31m%}'
local GREEN=$'%{\e[1;32m%}'
local YELLOW=$'%{\e[1;33m%}'
local BLUE=$'%{\e[1;34m%}'
local PURPLE=$'%{\e[1;35m%}'
local CYAN=$'%{\e[1;36m%}'
local WHITE=$'%{\e[1;37m%}'
local DEFAULT=$'%{\e[1;m%}'

case ${UID} in
0)
#    PROMPT="%B%{${fg[red]}%}%/#%{${reset_color}%}%b "
    PROMPT="%{${fg[cyan]}%}$(echo ${HOST%%.*} | tr '[a-z]' '[A-Z]') %B%{${fg[red]}%}%/#%{${reset_color}%}%b "
#    PROMPT="%{${fg[red]}%}[%n@%m %~]%%%{${reset_color}%} "
    PROMPT2="%B%{${fg[red]}%}%_#%{${reset_color}%}%b "
    SPROMPT="%B%{${fg[red]}%}%r is correct? [n,y,a,e]:%{${reset_color}%}%b "
#    [ -n "${REMOTEHOST}${SSH_CONNECTION}" ] && 
#        PROMPT="%{${fg[cyan]}%}$(echo ${HOST%%.*} | tr '[a-z]' '[A-Z]') ${PROMPT}"
    ;;
*)
#    PROMPT="%{${fg[white]}${bg[blue]%}[%n@%m %~]%%%{${reset_color}%} "
#    PROMPT="%{${fg[cyan]}%}[%n@%m %~]%%%{${reset_color}%} "
##    PROMPT="%{${fg[cyan]}%}%/%%%{${reset_color}%} "    
    PROMPT="%{$fg[cyan]%}%n@%m %# %{${reset_color}%}"
#    PROMPT="%B%{$fg[cyan]%}%n%{${reset_color}%}@%{$fg[green]%}%m%{${reset_color}%} %# %b"
    PROMPT2="%{${fg[blue]}%}%_%%%{${reset_color}%} "
    SPROMPT="%{${fg[yellow]}%}%r is correct? [n,y,a,e]:%{${reset_color}%} "
    [ -n "${REMOTEHOST}${SSH_CONNECTION}" ] && 
        PROMPT="%{${fg[green]}%}$(echo ${HOST%%.*} | tr '[a-z]' '[A-Z]') ${PROMPT}"
    ;;
esac

#PROMPT="%B%F{cyan}[%n@%m]%f%b %% "
#RPROMPT='%B%F{green}[%~]%f%b'

#####
# Colours {{{
#local HOSTNAME_COLOR=$'%{\e[38;5;190m%}'
#local USERNAME_COLOR=$'%{\e[38;5;199m%}'
#local PATH_COLOR=$'%{\e[38;5;61m%}'
#local RVM_COLOR=$'%{\e[38;5;31m%}'
#local VCS_COLOR=$'%{\e[38;5;248m%}'
# }}}

# Prompt {{{
# colors#  → 色指定  $fg[色名]/$bg[色名]/$reset_color (${, $} で囲む必要がある)
# 30黒 31赤 32緑 33黄 34青 35紫 36水 37白
# http://coderepos.org/share/export/9486/dotfiles/zsh/mobcov/.zsh/.zshrc

#RVM_INFO=$'%{$RVM_COLOR%}$(rvm_prompt)%{${reset_color}%}'
#PROMPT="%{$USERNAME_COLOR%}${USER}%(!.#.$)%{${reset_color}%} "
#VCS_INFO="%1(v|%{$VCS_COLOR%}%1v%f|)"
#RPROMPT="${VCS_INFO}${RVM_INFO}%{$PATH_COLOR%}[%~]%{${reset_color}%}"
#SPROMPT="%{${fg[red]}%}%r is correct? [n,y,a,e]:%{${reset_color}%} "
#PROMPT="%{$HOSTNAME_COLOR%}$(echo ${HOST%%.*} | tr '[a-z]' '[A-Z]') ${PROMPT}"
#####

RPROMPT="%{$fg[yellow]%}%~%{${reset_color}%}"
#RPROMPT="%{$fg[yellow]%}%${rvm_prompt}~%{${reset_color}%}"

#RPROMPT=$GREEN'[%~]'$DEFAULT
#setopt PROMPT_SUBST
######################################################################
nprom () {
    setopt prompt_subst
    local rbase=$'%{\e[33m%}%B[%~]%b%{\e[m%}' lf=$'\n'
    local pct=$'%0(?||%18(?||%{\e[31m%}))%#%{\e[m%}'
    RPROMPT="%9(~||$rbase)"
    case "$USER" in
        kzmcond)  PROMPT=$'%{\e[36m%}%S[%n@%m]%s %%%{\e[m%} ' ;;
        java)   PROMPT=$'%{\e[36m%}%U%m{%n}%%%{\e[m%}%u ' ;;
        *)      local pbase=$'%{\e[$[32+RANDOM%5]m%}%U%B%m{%n}%b'"$pct%u "
                PROMPT="%9(~|$rbase$lf|)$pbase"
                ;;
    esac
#    [[ "$TERM" = "screen" ]] && RPROMPT="[%B%~%b]"
}
nprom
######################################################################
# プロンプトのテーマ
autoload -Uz promptinit && promptinit

#prompt clint
#prompt elite2 green
#prompt elite2 magenta
#prompt elite2 red
#prompt elite2 yellow
#prompt elite2 blue
#prompt elite2 cyan
