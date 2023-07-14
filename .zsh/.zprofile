### ---- PATH config ----------------------------------------
export PATH="$HOME/bin:$HOME/.local/bin:$PATH"
export PATH="/opt/flutter/bin:$HOME/.pub-cache/bin:$PATH"
export PATH="$HOME/.detaspace/bin:$PATH"

### ---- General config -------------------------------------
export EDITOR='nvim'
export VISUAL='nvim'
export PAGER='less'
export TERMINAL='alacritty'
export TERM='alacritty'

### ---- Directory config -----------------------------------
export PICTURES_DIR=$HOME/Pictures
export DOWNLOADS_DIR=$HOME/Downloads
export MUSIC_DIR=$HOME/Music
export VIDEOS_DIR=$HOME/Videos
export DOCUMENTS_DIR=$HOME/Documents
export PROJECTS_DIR=$HOME/projects

### ---- Auto start -----------------------------------------
if [[ "$(tty)" = "/dev/tty1" ]]; then
	pgrep i3 || startx
fi
