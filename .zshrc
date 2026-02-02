# ==========================================================
# 環境変数・パス設定
# ==========================================================
# mysqlのpath
export PATH="/opt/homebrew/opt/mysql@8.0/bin:$PATH"
export LDFLAGS="-L/opt/homebrew/opt/mysql@8.0/lib"
export CPPFLAGS="-I/opt/homebrew/opt/mysql@8.0/include"
export PKG_CONFIG_PATH="/opt/homebrew/opt/mysql@8.0/lib/pkgconfig"

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# AWS / Mise
export PATH="/usr/local/bin/aws:$PATH"
export PATH="~/.local/bin/mise:$PATH"

# ruby (rbenv)
if command -v rbenv >/dev/null 2>&1; then
  eval "$(rbenv init -)"
fi

# python (pyenv)
if command -v pyenv >/dev/null 2>&1; then
  export PYENV_ROOT="$HOME/.pyenv"
  export PATH="$PYENV_ROOT/bin:$PATH"
  eval "$(pyenv init -)"
fi

# ImageMagick
export PATH="/opt/homebrew/opt/imagemagick@6/bin:$PATH"

# Go
# export PATH="$(go env GOPATH)/bin:$PATH"

# Mise
if command -v mise >/dev/null 2>&1; then
  eval "$(mise activate zsh)"
fi

# Aqua
if command -v aqua >/dev/null 2>&1; then
  export PATH="$(aqua root-dir)/bin:$PATH"
fi

export CGO_CFLAGS="-DHAVE_STRCHRNUL -mmacosx-version-min=15.4"
export MACOSX_DEPLOYMENT_TARGET=15.4

# ==========================================================
# 設定・オプション
# ==========================================================
export HISTFILE=~/.zsh_history
export HISTSIZE=100000
export SAVEHIST=100000

# setopt 関連
setopt auto_pushd        # ディレクトリ移動が自動でpushd
setopt pushd_ignore_dups # popdの重複削除
setopt auto_cd           # cd無しで移動できる
setopt hist_ignore_dups  # historyの重複削除
setopt share_history     # 他のzshで履歴(history)を共有

# ==========================================================
# プロンプト設定 (git情報表示など)
# ==========================================================
autoload -Uz vcs_info
setopt prompt_subst
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr "%F{magenta}!"
zstyle ':vcs_info:git:*' unstagedstr "%F{yellow}+"
zstyle ':vcs_info:*' formats "%F{cyan}%c%u[%b]%f"
zstyle ':vcs_info:*' actionformats '[%b|%a]'
precmd () { vcs_info }

export PATH="$HOME/.rbenv/bin:$PATH"
export PS1="%n@ %1~ %# "
PROMPT='
[%F{red}%m%f%b:%F{green}%~%f]%F{cyan}$vcs_info_msg_0_%f
%F{yellow}$%f '

# ==========================================================
# エイリアス
# ==========================================================
alias vi="nvim"
alias vim="nvim"
alias view="nvim -R"
alias zshconfig="vim ~/.zshrc"
alias dotfile="vim ~/dotfiles"
alias zshreload="source ~/.zshrc"
# alias ohmyzsh="vim ~/.oh-my-zsh" <-- Oh My Zsh は使わなくなるので不要ですが、記念に残すならそのままで
alias sheldonconfig="vim ~/.config/sheldon/plugins.toml" # Sheldon設定用のエイリアスを追加しておくと便利です
alias bup="brew update && brew upgrade"
alias gae="git commit --allow-empty -m"
alias game="git commit --amend --no-edit"
alias dc="docker compose"
alias du="docker compose down && docker compose up"
alias tidy="go mod tidy"

# プロジェクト
alias bot="cd ~/workspace/myope/myope-bot"
alias favy="cd ~/workspace/favy"
alias ote="cd ~/workspace/otetsutabi-next"
alias sre="cd ~/workspace/sre-study-rails-app"
alias hr="cd ~/workspace/hrbrain"
alias oci="cd ~/workspace/hrbrain/apps/ocicat/app"
alias sib="cd ~/workspace/hrbrain/apps/siberian/app"
alias td="tilt down"

# terraform
alias t='terraform'
alias tf='terraform fmt --recursive'
alias ti='terraform import'
alias tin='terraform init'
alias tss='terraform state show'
alias tsl='terraform state list'
alias tsrm='terraform state rm'
alias tp='terraform plan'
alias ta='terraform apply'
alias tsmv='terraform state mv'
alias tui='tftui'

## setup-env
if [ -f ~/dotfiles/.zshrc.local ]; then
    source ~/dotfiles/.zshrc.local
fi
export TENV_AUTO_INSTALL=true

# ==========================================================
# Taskfile
# ==========================================================
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

eval "$(sheldon source)"
eval "$(direnv hook zsh)"

# ==========================================================
# fzf コマンド検索
# ==========================================================
function history_search_with_fzf() {
    local selected_command
    # historyコマンドの出力を反転させてfzfに渡す
    selected_command=$(history -n 1 | (tac 2>/dev/null || tail -r) | awk '!a[$0]++' | fzf --height 40% --layout=reverse --border)
    if [ -n "$selected_command" ]; then
        BUFFER=$selected_command
        CURSOR=$#BUFFER
    fi
    zle reset-prompt
}
zle -N history_search_with_fzf

# 全ての設定が完了した後に、確実に bindkey を適用するための関数
function _apply_my_keybinds() {
    bindkey '^r' history_search_with_fzf
    bindkey '^R' history_search_with_fzf
}

# sheldon や mise が全て読み込まれた後に実行されるようにする
# zsh-defer が入っている場合はそれを利用
if (( $+functions[zsh-defer] )); then
    zsh-defer _apply_my_keybinds
else
    # zsh-defer がない場合は直接実行
    _apply_my_keybinds
fi
