# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git autojump web-search fzf docker docker-compose)

source $ZSH/oh-my-zsh.sh

fpath=(~/.zsh/completion $fpath)

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases

# mysqlのpath
export PATH="/opt/homebrew/opt/mysql@8.0/bin:$PATH"
export LDFLAGS="-L/opt/homebrew/opt/mysql@8.0/lib"
export CPPFLAGS="-I/opt/homebrew/opt/mysql@8.0/include"
export PKG_CONFIG_PATH="/opt/homebrew/opt/mysql@8.0/lib/pkgconfig"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# git
autoload -Uz vcs_info
setopt prompt_subst
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr "%F{magenta}!"
zstyle ':vcs_info:git:*' unstagedstr "%F{yellow}+"
zstyle ':vcs_info:*' formats "%F{cyan}%c%u[%b]%f"
zstyle ':vcs_info:*' actionformats '[%b|%a]'
precmd () { vcs_info }

# プロンプトカスタマイズ
export PATH="$HOME/.rbenv/bin:$PATH"
export PS1="%n@ %1~ %# "
PROMPT='
[%F{red}%m%f%b:%F{green}%~%f]%F{cyan}$vcs_info_msg_0_%f
%F{yellow}$%f '

# historyの設定
export HISTFILE=~/.zsh_history
export HISTSIZE=100000
export SAVEHIST=100000

export PATH="/usr/local/bin/aws:$PATH"
export PATH="~/.local/bin/mise:$PATH"

# rubyのpath
if command -v rbenv >/dev/null 2>&1; then
  eval "$(rbenv init -)"
fi

# pythonのpath
if command -v pyenv >/dev/null 2>&1; then
  export PYENV_ROOT="$HOME/.pyenv"
  export PATH="$PYENV_ROOT/bin:$PATH"
  eval "$(pyenv init -)"
fi

# nodeのpath
# export PATH="$HOME/.nodebrew/current/bin:$PATH"

# その他path
export PATH="/opt/homebrew/opt/imagemagick@6/bin:$PATH"

# エイリアス
alias vi="nvim"
alias vim="nvim"
alias view="nvim -R"
alias zshconfig="vim ~/.zshrc"
alias dotfile="vim ~/dotfiles"
alias zshreload="source ~/.zshrc"
alias ohmyzsh="vim ~/.oh-my-zsh"
alias bup="brew update && brew upgrade"
alias gae="git commit --allow-empty -m"
alias game="git commit --amend --no-edit"
alias dc="docker compose"
alias du="docker compose down && docker compose up"
alias tidy="go mod tidy"

# プロジェクトのエイリアス
alias bot="cd ~/workspace/myope/myope-bot"
alias favy="cd ~/workspace/favy"
alias ote="cd ~/workspace/otetsutabi-next"
alias sre="cd ~/workspace/sre-study-rails-app"
# find / -name <ファイル名> #linuxのfindコマンド

setopt auto_pushd # ディレクトリ移動が自動でpushd
setopt pushd_ignore_dups # popdの重複削除
setopt auto_cd # cd無しで移動できる
setopt hist_ignore_dups # historyの重複削除
setopt share_history # 他のzshで履歴(history)を共有

# Go
# export PATH="$(go env GOPATH)/bin:$PATH"
# mise
if command -v mise >/dev/null 2>&1; then
  eval "$(mise activate zsh)"
fi
# aqua
if command -v aqua >/dev/null 2>&1; then
  export PATH="$(aqua root-dir)/bin:$PATH"
fi

export CGO_CFLAGS="-DHAVE_STRCHRNUL -mmacosx-version-min=15.4" 
export MACOSX_DEPLOYMENT_TARGET=15.4

source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

alias hr="cd ~/workspace/hrbrain"
alias oci="cd ~/workspace/hrbrain/apps/ocicat/app"
alias sib="cd ~/workspace/hrbrain/apps/siberian/app"
alias td="tilt down"


#compdef task
compdef _task task
typeset -A opt_args

_GO_TASK_COMPLETION_LIST_OPTION="${GO_TASK_COMPLETION_LIST_OPTION:---list-all}"

# Listing commands from Taskfile.yml
function __task_list() {
    local -a scripts cmd
    local -i enabled=0
    local taskfile item task desc

    cmd=(task)
    taskfile=${(Qv)opt_args[(i)-t|--taskfile]}
    taskfile=${taskfile//\~/$HOME}


    if [[ -n "$taskfile" && -f "$taskfile" ]]; then
        enabled=1
        cmd+=(--taskfile "$taskfile")
    else
        for taskfile in {T,t}askfile{,.dist}.{yaml,yml}; do
            if [[ -f "$taskfile" ]]; then
                enabled=1
                break
            fi
        done
    fi

    (( enabled )) || return 0

    scripts=()
    for item in "${(@)${(f)$("${cmd[@]}" $_GO_TASK_COMPLETION_LIST_OPTION)}[2,-1]#\* }"; do
        task="${item%%:[[:space:]]*}"
        desc="${item##[^[:space:]]##[[:space:]]##}"
        scripts+=( "${task//:/\\:}:$desc" )
    done
    _describe 'Task to run' scripts
}

_task() {
    _arguments \
        '(-C --concurrency)'{-C,--concurrency}'[limit number of concurrent tasks]: ' \
        '(-p --parallel)'{-p,--parallel}'[run command-line tasks in parallel]' \
        '(-f --force)'{-f,--force}'[run even if task is up-to-date]' \
        '(-c --color)'{-c,--color}'[colored output]' \
        '(-d --dir)'{-d,--dir}'[dir to run in]:execution dir:_dirs' \
        '(--dry)--dry[dry-run mode, compile and print tasks only]' \
        '(-o --output)'{-o,--output}'[set output style]:style:(interleaved group prefixed)' \
        '(--output-group-begin)--output-group-begin[message template before grouped output]:template text: ' \
        '(--output-group-end)--output-group-end[message template after grouped output]:template text: ' \
        '(-s --silent)'{-s,--silent}'[disable echoing]' \
        '(--status)--status[exit non-zero if supplied tasks not up-to-date]' \
        '(--summary)--summary[show summary\: field from tasks instead of running them]' \
        '(-t --taskfile)'{-t,--taskfile}'[specify a different taskfile]:taskfile:_files' \
        '(-v --verbose)'{-v,--verbose}'[verbose mode]' \
        '(-w --watch)'{-w,--watch}'[watch-mode for given tasks, re-run when inputs change]' \
        + '(operation)' \
            {-l,--list}'[list describable tasks]' \
            {-a,--list-all}'[list all tasks]' \
            {-i,--init}'[create new Taskfile.yml]' \
            '(-*)'{-h,--help}'[show help]' \
            '(-*)--version[show version and exit]' \
            '*: :__task_list'
}

# don't run the completion function when being source-ed or eval-ed
if [ "$funcstack[1]" = "_task" ]; then
    _task "$@"
fi

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
