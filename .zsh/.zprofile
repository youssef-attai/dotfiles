### ---- PATH config ----------------------------------------
export PATH=$HOME/bin:$HOME/.local/bin:$PATH
export PATH=/opt/flutter/bin:$HOME/.pub-cache/bin:$PATH

### ---- General config -------------------------------------
export EDITOR='nvim'
export VISUAL='nvim'
export PAGER='less'
export BROWSER='firefox'
export TERMINAL='alacritty'
export TERM='alacritty'

### ---- Directory config -----------------------------------
export PICTURES_DIR=$HOME/pictures
export DOWNLOADS_DIR=$HOME/downloads
export MUSIC_DIR=$HOME/music
export VIDEOS_DIR=$HOME/videos
export DOCUMENTS_DIR=$HOME/documents
export PROJECTS_DIR=$HOME/projects

### ---- Auto start -----------------------------------------
if [[ "$(tty)" = "/dev/tty1" ]]; then
	pgrep i3 || startx
fi
