# 文字コードの設定
export LANG=ja_JP.UTF-8

# macports UNINSTALLED
# export PATH=/opt/local/bin:/opt/local/sbin/:$PATH
# export MANPATH=/opt/local/man:$MANPATH

# パスの設定
PATH=${HOME}/.cabal/bin:/usr/local/bin:$PATH
export PATH=/Users/rimd2r/go/go_appengine:$PATH
export MANPATH=/usr/local/man:/usr/share/man

# 関数
find-grep () { find . -type f -print | xargs grep -n --binary-files=without-match $@ }

# エイリアスの設定
alias ls='ls -F -G'
alias ll='ls -a -l'
alias uim='/Library/Frameworks/UIM.framework/Versions/Current/bin/uim-xim &'
alias vi='vim'
alias logbook='java -XstartOnFirstThread -jar ~/Dropbox/logbook/logbook.jar'
##alias gd='dirs -v; echo -n "select number: "; read newdir; cd +"$newdir"'

# プロンプトの設定
local GREEN=$'%{[32m%}'
local YELLOW=$'%{[33m%}'
local BLUE=$'%{[34m%}'
local DEFAULT=$'%{[00m%}'

#PROMPT=''$GREEN'%n@%m '$YELLOW'%c#'$DEFAULT' '$'\n%(!.#.$) ' 
PROMPT=''$GREEN'%n@%m '$YELLOW'%/%#'$DEFAULT' '$'\n%(!.#.$) ' 

# ヒストリの設定
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
# 履歴ファイルに時刻を記録
setopt extended_history
# シェルのプロセスごとに履歴を共有
setopt share_history


# 補完するかの質問は画面を超える時にのみに行う｡
LISTMAX=0
# 補完の利用設定
autoload -U compinit; compinit
# sudo でも補完の対象
zstyle ':completion:*:sudo:*' command-path /usr/local/sbin /usr/local/bin /usr/sbin /usr/bin /sbin /bin

## auto系
# cdのタイミングで自動的にpushd
setopt auto_pushd
# 複数の zsh を同時に使う時など history ファイルに上書きせず追加
setopt append_history
# 補完候補が複数ある時に、一覧表示
setopt auto_list
# 補完キー（Tab, Ctrl+I) を連打するだけで順に補完候補を自動で補完
setopt auto_menu
# カッコの対応などを自動的に補完
setopt auto_param_keys
# ディレクトリ名の補完で末尾の / を自動的に付加し、次の補完に備える
setopt auto_param_slash


# ビープ音を鳴らさないようにする
setopt NO_beep

##################################
## history
##################################
# 直前と同じコマンドラインはヒストリに追加しない
setopt hist_ignore_dups
# 重複したヒストリは追加しない
setopt hist_ignore_all_dups
# ヒストリを呼び出してから実行する間に一旦編集できる状態になる
setopt hist_verify

# auto_list の補完候補一覧で、ls -F のようにファイルの種別をマーク表示しない
setopt NO_list_types
# コマンドラインの引数で --prefix=/usr などの = 以降でも補完できる
setopt magic_equal_subst
# ファイル名の展開でディレクトリにマッチした場合末尾に / を付加する
setopt mark_dirs
# 8 ビット目を通すようになり、日本語のファイル名を表示可能
setopt print_eight_bit
# Ctrl+wで､直前の/までを削除する｡
WORDCHARS='*?_-.[]~=&;!#$%^(){}<>'
# ディレクトリを水色にする｡
export LS_COLORS='di=01;36'
# ファイルリスト補完でもlsと同様に色をつける｡
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

##################################
# キーバインド
##################################
# vi
#""bindkey -v

autoload -Uz history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end



# ^で､cd ..
function cdup() {
	    echo
		    cd ..
			    zle reset-prompt
}
zle -N cdup
bindkey '\^' cdup

# ディレクトリ名だけで､ディレクトリの移動をする｡
setopt auto_cd

# C-s, C-qを無効にする。
setopt NO_flow_control

# mine設定
[ -f ~/.zshrc.mine ] && source ~/.zshrc.mine


# Screenの設定
if [ $TERM = "screen" ]; then
    precmd() {
##        screen -X title $(basename `echo $PWD | sed -e "s/ /_/g"`)
        screen -X title $PWD
    }
    preexec() {
        screen -X title `echo $1 | cut -d " " -f 1`
    }
fi

# The next line updates PATH for the Google Cloud SDK.
source '/Users/rimd2r/google-cloud-sdk/path.zsh.inc'

# The next line enables shell command completion for gcloud.
source '/Users/rimd2r/google-cloud-sdk/completion.zsh.inc'
