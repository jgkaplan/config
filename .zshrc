#zmodload zsh/zprof

### Added by Zinit's installer
if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing %F{33}DHARMA%F{220} Initiative Plugin Manager (%F{33}zdharma/zinit%F{220})…%f"
    command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
    command git clone https://github.com/zdharma/zinit "$HOME/.zinit/bin" && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
        print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi

source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

### End of Zinit's installer chunk
zinit wait lucid for \
 atinit"ZINIT[COMPINIT_OPTS]=-C; zicompinit; zicdreplay" \
    zdharma/fast-syntax-highlighting \
 blockf \
    zsh-users/zsh-completions \
 atload"!_zsh_autosuggest_start" \
    zsh-users/zsh-autosuggestions


## Complete commands with history with up/down arrows
zinit light zsh-users/zsh-history-substring-search
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down


eval "$(starship init zsh)"


export NVM_COMPLETION=true
export NVM_LAZY_LOAD=true
export NVM_DIR="$HOME/.nvm"
zinit light lukechilds/zsh-nvm

# color ls
# alias ls='ls -G'
alias ls='exa'

export PATH=$PATH:/Applications/Racket\ v7.8/bin

# opam configuration
# test -r /Users/joshuakaplan/.opam/opam-init/init.zsh && . /Users/joshuakaplan/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true
export PATH="/usr/local/opt/bison/bin:$PATH"

export PATH=/Users/joshuakaplan/.local/bin:$PATH

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__my_conda_init() {
__conda_setup="$('/Users/joshuakaplan/opt/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/joshuakaplan/opt/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/joshuakaplan/opt/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/joshuakaplan/opt/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
}
zinit wait lucid for \
    atinit'__my_conda_init' \
    zdharma/null
unset __my_conda_init
# <<< conda initialize <<<

#zprof
