# export JAVA_HOME='/usr/lib/jvm/java-8-openjdk'
export ANDROID_SDK_ROOT='/opt/android-sdk'

### ---- PATH config ----------------------------------------
export PATH="$HOME/bin:$HOME/.local/bin:$PATH"
export PATH="/opt/flutter/bin:$HOME/.pub-cache/bin:$PATH"
export PATH="$HOME/.detaspace/bin:$PATH"
# export PATH=$JAVA_HOME/bin:$PATH 
export PATH=$PATH:$ANDROID_SDK_ROOT/platform-tools/
export PATH=$PATH:$ANDROID_HOME/cmdline-tools/latest/bin
export PATH=$PATH:$ANDROID_SDK_ROOT/tools/bin/
export PATH=$PATH:$ANDROID_ROOT/emulator
export PATH=$PATH:$ANDROID_SDK_ROOT/tools/

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
export SOUNDS_DIR=$HOME/.local/share/sounds

### ---- Auto start -----------------------------------------
# if [[ "$(tty)" = "/dev/tty1" ]]; then
# 	pgrep i3 || startx
# fi
