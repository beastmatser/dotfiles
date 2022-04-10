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
        git clone "https://github.com/$1.git" "$ZDOTDIR/plugins/$PLUGIN_NAME"
    fi
}

# Plugins from oh-my-zsh
function oh-my-plug() {
    if [ -f "$ZDOTDIR/plugins/$1.plugin.zsh" ]; then
        zsh_add_file "plugins/$1.plugin.zsh"
    else
        curl -O https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/plugins/$1/$1.plugin.zsh
        mv $1.plugin.zsh $ZDOTDIR/plugins/$1.plugin.zsh
    fi
}

# Remove unused plugins
# function clean() {}
