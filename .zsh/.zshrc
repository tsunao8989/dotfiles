#----------------------------------------------------------
# 環境変数
#----------------------------------------------------------
# 言語設定
export LANG=ja_JP.UTF-8
export LC_ALL=en_US.UTF-8
# PATH の追加
export PATH=/usr/local/bin:$PATH
# エディター設定
export EDITOR=vim
# ディレクトリスタックを20に制限
DIRSTACKSIZE=20

#----------------------------------------------------------
# Prezto 設定
#----------------------------------------------------------
# Prezto がインストールされている場合は設定を読み込む
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
  zstyle ':prezto:module:prompt' theme 'paradox'
fi

#----------------------------------------------------------
# Plugin 設定
#----------------------------------------------------------
# 補完機能の強化
autoload -U compinit && compinit -u
# プロンプトカラーの追加
autoload -Uz colors
colors

#----------------------------------------------------------
# 基本設定
#----------------------------------------------------------
# 日本語ファイル名を表示可能
setopt print_eight_bit
# ディレクトリ名だけで cd を有効
setopt auto_cd
# ビープ音を無効
setopt no_beep
# cd 時に自動でディレクトリスタックに追加
setopt auto_pushd
# 重複したディレクトリはスタックしない
setopt pushd_ignore_dups
# ディレクトリ補完時は末尾に/を表示
setopt no_auto_remove_slash
# 隠しファイルも補完
setopt glob_dots
# スペルミスの修正候補を提示
setopt correct
# ファイル名のスペルミスの修正候補を提示
setopt correct_all
# history コマンドは履歴に記録しない
setopt hist_no_store
# コマンド履歴に実行時間も記録
setopt extended_history
# コマンド中の余分なスペースは削除して履歴に記録
setopt hist_reduce_blanks
# 履歴をすぐに追加する(通常はシェル終了時)
setopt inc_append_history
# zsh間で履歴を共有
setopt share_history

#----------------------------------------------------------
# コマンド履歴
#----------------------------------------------------------
# 保存先
HISTFILE=~/.zsh_history
# 保存されるコマンド履歴件数
HISTSIZE=100000
# キャッシュするコマンド履歴件数
SAVEHIST=100000

#----------------------------------------------------------
# キーバインド
#----------------------------------------------------------
# キーバインドを vim モードに設定
bindkey -v

#----------------------------------------------------------
# alias 設定
#----------------------------------------------------------
# vim 設定
alias v='vim'
alias vi='vim'
# コマンド履歴の実行時刻と実行時間を表示. 表示件数は全件.
alias history='history -Di 1'
# grep で検索した文字列をハイライト
alias grep='grep --color=auto'
# 色付きで隠しファイルも表示
alias ls='ls -AFG'
alias dirs='dirs -v'
# git 設定
alias gad='git add'
alias glo='git log'
alias gph='git push'
alias gpl='git pull'
alias gco='git commit'
alias gpom='git push origin main'

# ディレクトリ移動
alias ...='cd ../'
alias ....='cd ../../'

# Vagrant
alias vgu='vagrant up'
alias vgh='vagrant halt'
alias vgs='vagrant ssh'

alias hw='sudo hwclock -s'

# Docker
alias dkpl='docker pull'
alias dkrn='docker run'
alias dkrmi='docker rmi'
alias dkps='docker ps -all'
alias dklg='docker logs'
alias dkhis='docker history'

#----------------------------------------------------------
# zstyle
#----------------------------------------------------------
# 補完候補を一覧から選択する
zstyle ':completion:*:default' menu select=2
# 大文字、小文字を区別せず補完する
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
# 補完時のハイライト設定
zstyle ':completion:*' list-colors ''
# sudo の後ろでもコマンド名を補完
zstyle ':completion:*:sudo:*' command-path /usr/local/sbin /usr/local/bin /usr/sbin /usr/bin /sbin /bin /usr/X11R6/bin

#----------------------------------------------------------
# umask
#----------------------------------------------------------
# 新規ファイルは644、新規ディレクトリは755
umask 022

#----------------------------------------------------------
# PATH
#----------------------------------------------------------
# nvm の読み込み
if [ -d $HOME/.nvm ]; then
    export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
fi

if [ -d $HOME/.pyenv ]; then
    path=($HOME/.pyenv/bin(N-/) $path)
    eval "$(pyenv init -)"
fi

# Rust の設定
if [ -d $HOME/.cargo ]; then
    source $HOME/.cargo/env
fi

if [ -d $HOME/go ]; then
    export GOROOT=/usr/local/go
    export GOPATH=$HOME/go
    export PATH=$PATH:$GOPATH/bin:$GOROOT/bin
fi

path=($HOME/bin(N-/) $path)

#----------------------------------------------------------
# Ubuntu 用の設定
#----------------------------------------------------------
# OS が Ubuntu の場合は ls fgrep egrep の alias を設定
if test `grep -E "Ubuntu$" /etc/lsb-release 2>&1 /dev/null | wc -l` -eq 1; then
    if test -x /usr/bin/dircolors; then
        test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
        alias ls='ls -a --color=auto'
        alias fgrep='fgrep --color=auto'
        alias egrep='egrep --color=auto'
    fi
fi