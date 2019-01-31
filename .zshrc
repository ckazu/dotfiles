# users generic .zshrc file for zsh(1)

## Environment variable configuration
# LANG
export LANG=ja_JP.UTF-8
export PATH=/usr/local/bin:$PATH
# JAVA
# export JAVA_HOME=`/usr/libexec/java_home`
# export PATH=$JAVA_HOME/bin:$PATH
export PATH=$PATH:/Applications/"Android Studio.app"/Contents/jre/jdk/Contents/Home/bin
export JAVA_HOME=/Applications/"Android Studio.app"/Contents/jre/jdk/Contents/Home
# export JAVA_OPTS='-XX:+IgnoreUnrecognizedVMOptions --add-modules java.se.ee'

# OTHERS
export BUNDLER_EDITOR=emacs
export EDITOR=vim
## Default shell configuration
# set prompt
autoload colors; colors

case ${UID} in
0)
    PROMPT="%B%{${fg[magenta]}%}%/ #%{${reset_color}%}%b "
    PROMPT2="%B%{${fg[magenta]}%}%_ #%{${reset_color}%}%b "
    SPROMPT="%B%{${fg[magenta]}%}%r is correct? [n,y,a,e]:%{${reset_color}%}%b "
    [ -n "${REMOTEHOST}${SSH_CONNECTION}" ] &&
        PROMPT="%{${fg[magenta]}%}$(echo ${HOST%%.*} | tr '[a-z]' '[A-Z]') ${PROMPT}"
    ;;
*)
    PROMPT="%{${fg[cyan]}%}%/ %%%{${reset_color}%} "
    PROMPT2="%{${fg[cyan]}%}%_ %%%{${reset_color}%} "
    SPROMPT="%{${fg[cyan]}%}%r is correct? [n,y,a,e]:%{${reset_color}%} "
    [ -n "${REMOTEHOST}${SSH_CONNECTION}" ] &&
        PROMPT="%{${fg[cyan]}%}$(echo ${HOST%%.*} | tr '[a-z]' '[A-Z]') ${PROMPT}"
    ;;
esac

# vcs
autoload -Uz add-zsh-hook
autoload -Uz vcs_info

zstyle ':vcs_info:*' enable git svn hg bzr
zstyle ':vcs_info:*' formats '[%s: %b]'
zstyle ':vcs_info:*' actionformats '[%s: %b|%a]'
zstyle ':vcs_info:(svn|bzr):*' branchformat '%b:r%r'
zstyle ':vcs_info:bzr:*' use-simple true

function _update_vcs_info_msg() {
    psvar=()
    LANG=en_US.UTF-8 vcs_info
    [[ -n "$vcs_info_msg_0_" ]] && psvar[1]="$vcs_info_msg_0_"
}
add-zsh-hook precmd _update_vcs_info_msg
RPROMPT="%1(v|%F{green}%1v%f|)"

# auto change directory
setopt auto_cd

# auto directory pushd that you can get dirs list by cd -[tab]
setopt auto_pushd

# command correct edition before each completion attempt
setopt correct

# compacked complete list display
setopt list_packed

# no remove postfix slash of command line
setopt noautoremoveslash

# no beep sound when complete list displayed
setopt nolistbeep


## Keybind configuration
bindkey -e

# historical backward/forward search with linehead string binded to ^P/^N
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^p" history-beginning-search-backward-end
bindkey "^n" history-beginning-search-forward-end
bindkey "\\ep" history-beginning-search-backward-end
bindkey "\\en" history-beginning-search-forward-end

bindkey "^[f" emacs-forward-word
bindkey "^[b" emacs-backward-word
export WORDCHARS=""

autoload smart-insert-last-word
zle -N insert-last-word smart-insert-last-word
zstyle :insert-last-word match \
  '*([^[:space:]][[:alpha:]/\\]|[[:alpha:]/\\][^[:space:]])*'
bindkey '^]' insert-last-word

# quote previous word in single or double quote
autoload -U modify-current-argument
_quote-previous-word-in-single() {
    modify-current-argument '${(qq)${(Q)ARG}}'
    zle vi-forward-blank-word
}
zle -N _quote-previous-word-in-single
bindkey '^[s' _quote-previous-word-in-single

_quote-previous-word-in-double() {
    modify-current-argument '${(qqq)${(Q)ARG}}'
    zle vi-forward-blank-word
}
zle -N _quote-previous-word-in-double
bindkey '^[d' _quote-previous-word-in-double

## Command history configuration
HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000
setopt hist_ignore_dups     # ignore duplication command history list
setopt share_history        # share command history data


## Completion configuration
fpath=(~/.zsh/functions/Completion ${fpath})
autoload -U compinit; compinit

## zsh editor
autoload zed

## zsh rename
autoload zmv

## Alias configuration
setopt complete_aliases

alias where="command -v"
alias j="jobs -l"

case "${OSTYPE}" in
freebsd*)
    alias ls="ls -G -w"
    ;;
darwin*)
    alias ls="ls -a -G"
    ;;
linux*)
    alias ls="ls -a --color"
    alias open="gnome-open"
    ;;
esac

alias la="ls -a"
alias lf="ls -F"
alias ll="ls -l"

alias du="du -h"
alias df="df -h"

alias su="su -l"
alias sl="sl -ae"

alias gomi='touch gomigomi\~ \.gomigomi\~ \#gomigomi\#; rm -f *\~; rm -f \.*\~; rm -f \#*\#'

alias r="rails"
function dbox() { emacs ~/Dropbox/memos/${1}& }

case "${OSTYPE}" in
darwin*)
    alias updateports="sudo port selfupdate; sudo port outdated"
    alias portupgrade="sudo port upgrade installed"
    ;;
freebsd*)
    case ${UID} in
    0)
        updateports()
        {
            if [ -f /usr/ports/.portsnap.INDEX ]
            then
                portsnap fetch update
            else
                portsnap fetch extract update
            fi
            (cd /usr/ports/; make index)

            portversion -v -l \<
        }
        alias appsupgrade='pkgdb -F && BATCH=YES NO_CHECKSUM=YES portupgrade -a'
        ;;
    esac
    ;;
esac


## terminal configuration
export LESS='-R'
# export LESSOPEN='| /usr/share/source-highlight/src-hilite-lesspipe.sh %s' # apt-get install source-highlight
export LESSOPEN='| /usr/local/Cellar/source-highlight/3.1.7/bin/src-hilite-lesspipe.sh %s' # brew install source-highlight

unset LSCOLORS
case "${TERM}" in
xterm)
    export TERM=xterm-color
    ;;
kterm)
    export TERM=kterm-color
    # set BackSpace control character
    stty erase
    ;;
cons25)
    unset LANG
    export LSCOLORS=ExFxCxdxBxegedabagacad
    export LS_COLORS='di=01;34:ln=01;35:so=01;32:ex=01;31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
    zstyle ':completion:*' list-colors \
        'di=;34;1' 'ln=;35;1' 'so=;32;1' 'ex=31;1' 'bd=46;34' 'cd=43;34'
    ;;
esac

# set terminal title including current directory
case "${TERM}" in
kterm*|xterm*)
    precmd() {
        echo -ne "\033]0;${USER}@${HOST%%.*}:${PWD}\007"
    }
    export LSCOLORS=exfxcxdxbxegedabagacad
    export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
    zstyle ':completion:*' list-colors \
        'di=34' 'ln=35' 'so=32' 'ex=31' 'bd=46;34' 'cd=43;34'
    ;;
esac

## load user .zshrc configuration file
[ -f ~/.zshmyrc ] && source ~/.zshmyrc

# if [[ -s "$HOME/.rvm/scripts/rvm" ]]  ; then source "$HOME/.rvm/scripts/rvm" ; fi

# # git completion
# autoload bashcompinit
# bashcompinit
# source ~/git-completion.bash

## attach screen
# screen -xR
export LESSOPEN="| src-hilite-lesspipe.sh %s"
export LESS=" -R "
[ -f ~/.zsh/antigen/antigen.zsh ] && source ~/.zshrc.antigen

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

# export ANDROID_HOME=/usr/local/opt/android-sdk
export ANDROID_HOME=/Users/kchinda/Library/Android/sdk
export PYTHONPATH=~/work/caffe/python:$PYTHONPATH

### Add Flutter path
export PATH=/usr/local/flutter/bin:$PATH

# Add environment variable COCOS_CONSOLE_ROOT for cocos2d-x
# export COCOS_CONSOLE_ROOT=/Users/kchinnda/work/cocos2d-x-3.11.1/tools/cocos2d-console/bin
export COCOS_CONSOLE_ROOT=/Users/kchinnda/work/colorz/cocos2d/tools/cocos2d-console/bin
export PATH=$COCOS_CONSOLE_ROOT:$PATH

# Add environment variable COCOS_X_ROOT for cocos2d-x
export COCOS_X_ROOT=/Users/kchinnda/work
export PATH=$COCOS_X_ROOT:$PATH

# Add environment variable COCOS_TEMPLATES_ROOT for cocos2d-x
# export COCOS_TEMPLATES_ROOT=/Users/kchinnda/work/cocos2d-x-3.11.1/templates
export COCOS_TEMPLATES_ROOT=/Users/kchinnda/work/colorz/cocos2d/templates
export PATH=$COCOS_TEMPLATES_ROOT:$PATH

# Add environment variable NDK_ROOT for cocos2d-x
export NDK_ROOT=/usr/local/Cellar/android-ndk/r11b
export PATH=$NDK_ROOT:$PATH

# Add environment variable ANDROID_SDK_ROOT for cocos2d-x
export ANDROID_SDK_ROOT=/usr/local/Cellar/android-sdk/24.4.1_1
export PATH=$ANDROID_SDK_ROOT:$PATH
export PATH=$ANDROID_SDK_ROOT/tools:$ANDROID_SDK_ROOT/platform-tools:$PATH

# Add environment variable ANT_ROOT for cocos2d-x
export ANT_ROOT=/usr/local/Cellar/ant/1.9.6/bin
export PATH=$ANT_ROOT:$PATH

# The next line updates PATH for the Google Cloud SDK.
source '/Users/kchinnda/google-cloud-sdk/path.zsh.inc'
# The next line enables shell command completion for gcloud.
source '/Users/kchinnda/google-cloud-sdk/completion.zsh.inc'

# YARN
export PATH=$PATH:`yarn global bin`
# GO
export GOPATH=$HOME/gopath
export PATH=$PATH:/usr/local/opt/go/libexec/bin:$GOPATH/bin
# mono
export MONO_GAC_PREFIX="/usr/local"
# CUDA
export PATH=/Developer/NVIDIA/CUDA-8.0/bin:$PATH
export DYLD_LIBRARY_PATH=/Developer/NVIDIA/CUDA-8.0/lib:$DYLD_LIBRARY_PATH

# Google Cloud Functions Emulator
function f { command functions "$@" }

if which rbenv > /dev/null; then eval "$(rbenv init - zsh)"; fi

# added by travis gem
[ -f /Users/kchinnda/.travis/travis.sh ] && source /Users/kchinnda/.travis/travis.sh
