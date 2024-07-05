#!/usr/bin/env bash

shellUtilsDirPath="$HOME/.shell-utils"

source $shellUtilsDirPath/common.sh
source $shellUtilsDirPath/remote-desktop.sh

initialize-setup-utils() {
    osName=$(uname)
    if (( "$osName" == "Darwin" )); then
        echo "Intializing MacOS setup utils!"
        source $shellUtilsDirPath/setup/common.sh
        source $shellUtilsDirPath/setup/setup-mac-os.sh
        return 0
    fi

    if (( "$osName" == "Linux" )); then
        echo "Intializing Linux setup utils!"
        source $shellUtilsDirPath/setup/common.sh
        source $shellUtilsDirPath/setup/setup-linux.sh
        return 0
    fi

    echo "Operation system $osName is not supported!"
    return 1
}
