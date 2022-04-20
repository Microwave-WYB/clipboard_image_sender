# DO NOT USE! THERE IS A BUG

# Clipboard Image Sender
A simple script to send image in your clipboard (or any file you specify) to your KDE Connect device.

## Prerequisites

1. Install [KDE Connect](https://kde.org/applications/internet/kdeconnect) and pair your device.
2. Install [qrcp](https://github.com/claudiodangelis/qrcp)
3. Install either `xclip` (for X11) or `wl-clipboard` (for Wayland)
4. Any screenshot program that supports saving to clipboard (e.g. `gnome-screenshot`)

## Installation

First, clone the repository:

```bash
git clone https://github.com/Microwave-WYB/clipboard_image_sender.git
cd clipboard_image_sender
```

Use the `install.sh` script to install.

```bash
./install.sh
```

Follow the instructions to set up required packages and environment variables. You need to have `~/.local/bin` in your PATH. If you cannot find `send` command after installation, try to add `~/.local/bin` to your PATH by:

```bash
echo "export PATH=\$PATH:\$HOME/.local/bin" >> ~/.bashrc
source ~/.bashrc
```

Use the `uninstall.sh` script to uninstall.

```bash
./uninstall.sh
```

Or simply remove the file `~/.local/bin/send`

```bash
rm ~/.local/bin/send
```

## Usage

**Send to KDE Connect device**

To send an image to your device, take a screenshot and save it to clipboard. Then run the script:

```bash
send
```

This will automatically open the `kdeconnect-handler` interface, you will need to select the device you want to send the image to.

**Send via http and QR code**

Alternatively, you can use `-q` flag to send the image file using `qrcp`:

```bash
send -q
```

This will create a temporary http server and generate a QR code for you to scan. If your device cannot scan QR codes, you use the url in your browser instead. This is useful if you want to send the image to a device not paired with your KDE Connect. 

**Send any files**

You can also specify a custom file (not limited to image file) to send:

```bash
send -f <path to file>
```

## Enjoy!