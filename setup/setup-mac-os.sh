#!/usr/bin/env bash

# installs home-brew
install-brew() {
    # https://brew.sh
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
}

install-dev-tools() {
    brew install mise
    brew install ffmpeg
    mise install node@lts kotlin@lts
}
