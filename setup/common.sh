#!/usr/bin/env bash

installOhMyZsh() {
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)";
}

enableOhMyZshPlugins() {
    echo "Enabling ZSH plugins..."
    enableOhMyZshPlugin "git"
    enableOhMyZshPlugin "dotenv"
    enableOhMyZshPlugin "aws"
    enableOhMyZshPlugin "rust"
    enableOhMyZshPlugin "node"
    enableOhMyZshPlugin "npm"
    enableOhMyZshPlugin "golang"
    enableOhMyZshPlugin "gradle"
    enableOhMyZshPlugin "python"
    enableOhMyZshPlugin "pip"
    enableOhMyZshPlugin "history-substring-search"
    enableOhMyZshPlugin "ant"
    enableOhMyZshPlugin "sudo"
    enableOhMyZshPlugin "rsync"
}

enableOhMyZshPlugin() {
    zshrcLocation="$HOME/.zshrc"
    pluginName=$1

    if grep -q "plugins=([^)]* $pluginName [^)]*)" $zshrcLocation; then
        echo "Plugin '$pluginName' is already enabled."
    else
        sed -i.bak "s/plugins=(/&$pluginName /" $zshrcLocation
        echo "Plugin '$pluginName' added."
    fi
}

installStarship() {
    curl -sS https://starship.rs/install.sh | sh;

    echo "Configuring starship for nerd fonts..."
    configFileLocation="$HOME/.config/starship.toml"
    nerdfontPreset=$(starship preset nerd-font-symbols)

    mkdir -p "$HOME/.config"
    touch $configFileLocation
    echo "add_newline = false" >> $configFileLocation
    echo -e 'right_format = """$time"""\n' >> $configFileLocation
    echo "[time]" >> $configFileLocation
    echo "disabled = false" >> $configFileLocation
    echo -e "use_12hr = true\n" >> $configFileLocation
    echo "$nerdfontPreset" >> $configFileLocation

    echo "Activating starship..."
    echo 'eval "$(starship init zsh)"' >> "$HOME/.zshrc"
}
