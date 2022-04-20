#!/bin/bash

if [ -z "$(which qrcp)" ]; then
    echo "qrcp is not installed. Please visit https://github.com/claudiodangelis/qrcp"
    exit 1
fi

if [[ $XDG_SESSION_TYPE == "wayland" ]]; then
    if [ -z "$(which wl-paste)" ] ; then
        echo "wl-clipboard is not installed. Please install wl-clipboard with your package manager."
        exit 1
    fi
else 
    if [ -z "$(which xclip)" ] ; then
        echo "xclip is not installed. Please install xclip with your package manager."
        exit 1
    fi
fi

# Check for essential dependencies
if [ -z "$(which qrcp)" ]; then
    echo "qrcp is not installed. Please visit https://github.com/claudiodangelis/qrcp"
    exit 1
fi

if [ -z "$(which kdeconnect-handler)" ]; then
    echo "kdeconnect-handler is not installed. Please install kdeconnect with your package manager."
    exit 1
fi

# Create local bin if it doesn't exist
if ! [ -d "$HOME/.local/bin" ]; then
    mkdir -p "$HOME/.local/bin"
    echo "Created $HOME/.local/bin"
fi

# Check if local bin is in PATH
if [[ "$PATH" =~ (^|:)"$HOME/.local/bin"(|/)(:|$) ]]; then
    echo "$HOME/.local/bin is already in PATH"
else
    echo "Please add $HOME/.local/bin to your PATH"
fi

cp bin/send $HOME/.local/bin/send
echo "Copied bin/send to $HOME/.local/bin"

print_usage() {
    echo "Usage: send [-q] [-f <filename>]"
    echo "    -q: Use qrcp instead of kdeconnect-handler"
    echo "    -f: Use the given filename instead of a temporary one"
    echo "    -h: Print this help message"
    echo "Note: This script requires an image in your clipboard. "
    echo "      You can use any screenshot application or copy an image from web browsers."
}

print_usage