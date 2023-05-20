autoload -U compinit; compinit
zstyle ':completion:*' verbose yes
zstyle ':completion:*' completer _extensions _complete _approximate
zstyle ':completion:*' menu yes select
zmodload zsh/complist

### ---- PATH config ----------------------------------------
export PATH=$HOME/bin:$HOME/bin/blocks:$PATH

### ---- General config -------------------------------------
export EDITOR='nvim'
export VISUAL='nvim'
export PAGER='less'

### ZSH HOME
export ZSH=$HOME/.zsh

### ---- history config -------------------------------------
export HISTFILE=$ZSH/.zsh_history

# How many commands zsh will load to memory.
export HISTSIZE=10000

# How many commands history will save on file.
export SAVEHIST=10000

# History won't save duplicates.
setopt HIST_IGNORE_ALL_DUPS

# History won't show duplicates on search.
setopt HIST_FIND_NO_DUPS

## Vim mode
bindkey -v
export KEYTIMEOUT=1

# use the vi navigation keys in menu completion
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history

# Fix backspace bug when switching modes
bindkey "^?" backward-delete-char

# Change cursor shape for different vi modes.
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = 'block' ]]; then
    echo -ne '\e[1 q'
  elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} = '' ]] ||
       [[ $1 = 'beam' ]]; then
    echo -ne '\e[5 q'
  fi
}
zle -N zle-keymap-select

# ci", ci', ci`, di", etc
autoload -U select-quoted
zle -N select-quoted
for m in visual viopp; do
  for c in {a,i}{\',\",\`}; do
    bindkey -M $m $c select-quoted
  done
done

# ci{, ci(, ci<, di{, etc
autoload -U select-bracketed
zle -N select-bracketed
for m in visual viopp; do
  for c in {a,i}${(s..)^:-'()[]{}<>bB'}; do
    bindkey -M $m $c select-bracketed
  done
done

zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[5 q"
}
zle -N zle-line-init

# change directory on ranger exit
function ranger-cd {
    # create a temp file and store the name
    tempfile="$(mktemp -t tmp.XXXXXX)"

    # run ranger and ask it to output the last path into the
    # temp file
    ranger --choosedir="$tempfile" "${@:-$(pwd)}"

    # if the temp file exists read and the content of the temp
    # file was not equal to the current path
    test -f "$tempfile" &&
    if [ "$(cat -- "$tempfile")" != "$(echo -n `pwd`)" ]; then
        # change directory to the path in the temp file
        cd -- "$(cat "$tempfile")"
    fi

    # its not super necessary to have this line for deleting
    # the temp file since Linux should handle it on the next
    # boot
    rm -f -- "$tempfile"
}

### ---- PLUGINS -----------------------------------
source $ZSH/themes/spaceship-prompt/spaceship.zsh-theme
source $ZSH/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh
source $ZSH/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

source $ZSH/plugins/zsh-autopair/autopair.zsh
autopair-init

fpath=($ZSH/plugins/zsh-completions/src $fpath)

### --- Spaceship Config ------------------------------------
SPACESHIP_PROMPT_ORDER=(
  venv
  user          # Username section
  dir           # Current directory section
  host          # Hostname section
  git           # Git section (git_branch + git_status)
  hg            # Mercurial section (hg_branch  + hg_status)
  exec_time     # Execution time
  line_sep      # Line break
  # vi_mode       # Vi-mode indicator
  jobs          # Background jobs indicator
  exit_code     # Exit code section
  char          # Prompt character
)
SPACESHIP_USER_SHOW=always
SPACESHIP_PROMPT_ADD_NEWLINE=false
SPACESHIP_CHAR_SYMBOL="❯"
SPACESHIP_CHAR_SUFFIX=" "

### ---- ALIASES -------------------------------------------
source $HOME/.aliases

### --- ENV VARS -------------------------------------------
source $HOME/.env

### NEOFETCH
neofetch
