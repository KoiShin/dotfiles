export LANG=ja_JP.UTF-8
export CC=clang
export CXX=clang++

PATH="$PATH":"/Users/koishin/.scripts"

typeset -U path
path=(
	$path
	/Users/koishin/Applications/gcc-arm-none-eabi-4_8-2013q4/bin
)

alias ls='ls -FG'
alias ll='ls -l'
alias l='ls -al'
alias la='ls -a'
alias lss='sudo tmutil disablelocal && sudo tmutil enablelocal'
alias tree='tree -F'
alias -g ...='../..'
alias -g ....='../../..'
alias -g .....='../../../..'
alias -s rb=ruby py=python

# export LSCOLORS=gxfxcxdxhxegedabagacad
export LSCOLORS=exfxcxdxbxegedabagacad
export LS_COLORS='di=34;01:ln=36:so=32:pi=33:ex=01;31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
export ZLS_COLORS=$LS_COLORS
export CLICOLOR=true
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

autoload colors
colors

# PROMPT="%n:%~ %# "
# PROMPT="%n:%~ %(2L.#%L .)%# "

########################################
# 補完
# 補完機能を有効にする
fpath=(/usr/local/share/zsh-completions $fpath)
autoload -Uz compinit && compinit -u
setopt auto_list
setopt auto_param_keys
setopt auto_param_slash

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# ../ の後は今いるディレクトリを補完しない
zstyle ':completion:*' ignore-parents parent pwd ..
# sudo の後ろでコマンド名を補完する
zstyle ':completion:*:sudo:*' command-path /usr/local/sbin /usr/local/bin \
                    /usr/sbin /usr/bin /sbin /bin /usr/X11R6/bin

zstyle ':completion:*:descriptions' format '%BCompleting %d%b'
zstyle ':completion:*:messages' format '%d'
zstyle ':completion:*:warnings' format 'No matches'
zstyle ':completion:*' group-name ''

setopt auto_pushd

function cd() {
   builtin cd $@ && ls -GF;
}

function take() {
	mkdir -p "$@" && eval cd "\"\$$#\"";
}

function show() {
	defaults write com.apple.finder AppleShowAllFiles -boolean true;
	killall Finder;
}

function hide() {
	defaults delete com.apple.finder AppleShowAllFiles;
	killall Finder;
}

setopt auto_cd
setopt pushd_ignore_dups
setopt prompt_subst

case ${UID} in
0)
	# root User
	PROMPT=$'%(6~|[%~]\n|)%F{red}%B%U[%n@%D{%m/%d %T}]%u%b%f %# '
	RPROMPT="%{${fg[green]}%}%(6~||[%~])%{${reset_color}%}"
	;;

*)
	# Normal User
	PROMPT=$'%(6~|[%~]\n|)%F{cyan}[%n@%D{%m/%d %T}]%f %# '
	RPROMPT='%{${fg[green]}%}%(6~||[%~])%{${reset_color}%}'
	;;

esac

export HISTFILE=${HOME}/.zsh_history
export HISTSIZE=100
export SAVEHIST=1000
setopt hist_ignore_dups
setopt EXTENDED_HISTORY
setopt hist_ignore_all_dups
setopt hist_ignore_space
setopt hist_reduce_blanks

DISABLE_AUTO_TITLE="true"
export HOMEBREW_CACHE=~/Library/Caches/Homebrew
export PATH="$HOME/.anyenv/bin:$PATH"
eval "$(anyenv init -)"
