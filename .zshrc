#zmodload zsh/zprof

#####################
# ZSH settings      #
#####################
#don't beep
setopt nobeep
## TAB COMPLETIONS
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'       # Case insensitive tab completion
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"         # Colored completion (different colors for dirs/files/etc)
zstyle ':completion:*' rehash true                              # automatically find new executables in path
# Speed up completions
zstyle ':completion:*' accept-exact '*(N)'
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.cache/zsh_completion_cache
zstyle ':completion:*' menu select


#####################
# ZINIT             #
#####################
### Added by Zinit's installer
if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing DHARMA Initiative Plugin Manager (zdharma-continuum/zinit)…%f"
    command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
    command git clone https://github.com/zdharma-continuum/zinit $HOME/.zinit/bin && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%F" || \
        print -P "%F{160}▓▒░ The clone has failed.%F"
fi

source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

### End of Zinit's installer chunk


# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zdharma-continuum/zinit-annex-as-monitor \
    zdharma-continuum/zinit-annex-bin-gem-node \
    zdharma-continuum/zinit-annex-patch-dl \
    zdharma-continuum/zinit-annex-rust

zinit wait lucid light-mode for \
  atinit"zicompinit; zicdreplay" \
      zdharma-continuum/fast-syntax-highlighting \
  atload'bindkey "^[[A" history-substring-search-up; bindkey "^[[B" history-substring-search-down' \
      zsh-users/zsh-history-substring-search \
  atload"_zsh_autosuggest_start" \
      zsh-users/zsh-autosuggestions \
  blockf atpull'zinit creinstall -q .' \
      zsh-users/zsh-completions

#####################
# STARSHIP          #
#####################
eval "$(starship init zsh)"
# zinit ice as"command" from"gh-r" \ # `starship` binary as command, from github release
#           atclone"./starship init zsh > init.zsh; ./starship completions zsh > _starship" \ # starship setup at clone(create init.zsh, completion)
#           atpull"%atclone" src"init.zsh" # pull behavior same as clone, source init.zsh
# zinit light starship/starship


#####################
# NVM               #
#####################
# export NVM_COMPLETION=true
# export NVM_LAZY_LOAD=true
# export NVM_DIR="$HOME/.nvm"
# zinit light lukechilds/zsh-nvm
zinit ice wait lucid
zinit snippet OMZ::plugins/nvm
#####################
# EXA colors        #
#####################
zinit ice wait"2" lucid from"gh-r" as"program" mv"bin/exa* -> exa"
zinit light ogham/exa
# zinit ice wait blockf atpull'zinit creinstall -q .'
# color ls
# alias ls='ls -G'
alias ls='exa'


#####################
# PATH              #
#####################
export PATH=$PATH:/Applications/Racket\ v7.8/bin

# opam configuration
# test -r /Users/joshuakaplan/.opam/opam-init/init.zsh && . /Users/joshuakaplan/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true
export PATH="/usr/local/opt/bison/bin:$PATH"
export PATH=$HOME/.local/bin:$PATH


#####################
# CONDA             #
#####################
# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__my_conda_init() {
__conda_setup="$("${HOME}/opt/anaconda3/bin/conda" 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "$HOME/opt/anaconda3/etc/profile.d/conda.sh" ]; then
        . "$HOME/opt/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="$HOME/opt/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
}
zinit wait lucid for \
    atinit'__my_conda_init' \
    zdharma-continuum/null
unset __my_conda_init
# <<< conda initialize <<<

#####################
# ALSO              #
#####################
alias also="$HOME/Documents/School\ Stuff/2020-2021/Spring\ Semester/research/also/src/also"

#####################
# jog command       #
#####################
function zshaddhistory() {
	echo "${1%%$'\n'}|${PWD}   " >> ~/.zsh_history_ext
}

function jog() {
    grep -v "jog" ~/.zsh_history_ext | grep -a --color=never "${PWD}   " | cut -f1 -d"|" | tail
}

#zprof
