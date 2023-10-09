### ---- PROMPT -------------------------------------------
eval "$(starship init zsh)"

### ---- Chrome executable ----------------------------------
export CHROME_EXECUTABLE=google-chrome-stable

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

### ---- PLUGINS -------------------------------------------

# FZF Tab (Has to be first)
autoload -Uz compinit
compinit
source /usr/share/zsh/plugins/fzf-tab-git/fzf-tab.plugin.zsh

# ZSH Vi Mode
source /usr/share/zsh/plugins/zsh-vi-mode/zsh-vi-mode.plugin.zsh

# ZSH Autopair
source /usr/share/zsh/plugins/zsh-autopair/autopair.zsh
autopair-init

# ZSH Autosuggestions
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# ZSH Syntax Highlighting
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

### ---- ALIASES -------------------------------------------
source $HOME/.aliases

### --- GTK Dark theme
export GTK_THEME=Adwaita:dark

### NEOFETCH
neofetch
