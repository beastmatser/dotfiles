# A list of enabled plugins
declare -A PLUGINS=()

# Function to source files if they exist
function zsh_add_file() {
    [ -f "$ZDOTDIR/$1" ] && source "$ZDOTDIR/$1"
}

# Normal plugins
function plug() {
    PLUGIN_NAME=$(echo $1 | cut -d "/" -f 2)
    if [ -d "$ZDOTDIR/plugins/$PLUGIN_NAME" ]; then
        zsh_add_file "plugins/$PLUGIN_NAME/$PLUGIN_NAME.plugin.zsh" ||
            zsh_add_file "plugins/$PLUGIN_NAME/$PLUGIN_NAME.zsh"
    else
        echo "\nInstalling plugin \033[0;36m$PLUGIN_NAME\033[0m:"
        git clone "https://github.com/$1.git" "$ZDOTDIR/plugins/$PLUGIN_NAME"
    fi
    PLUGINS[$PLUGIN_NAME]=$PLUGIN_NAME
}

# Plugins from oh-my-zsh
function oh-my-plug() {
    if [ -f "$ZDOTDIR/plugins/$1.plugin.zsh" ]; then
        zsh_add_file "plugins/$1.plugin.zsh"
    else
        echo "\nInstalling plugin \033[0;36m$1\033[0m:"
        curl -O https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/plugins/$1/$1.plugin.zsh
        mv $1.plugin.zsh $ZDOTDIR/plugins/$1.plugin.zsh
    fi
    PLUGINS[$1.plugin.zsh]=$1
}

# Remove unused plugins
function clean() {
    cleaned=false
    for file in "$ZDOTDIR/plugins"/*; do
        PLUGIN_NAME=$(echo $file | cut -d "/" -f 7)
        # Skip pure theme
        if [ "$PLUGIN_NAME" = "pure" ]; then; continue; fi
        if [[ ! ${PLUGINS[$PLUGIN_NAME]} ]]; then
            echo "Removing plugin: \e[31m$PLUGIN_NAME\e[0m"
            rm -rf "$file"
            cleaned=true
        fi
    done
    if [ "$cleaned" = false ]; then
        echo "✨ \033[0;36mNo unused plugins found\033[0m"
    fi
}
