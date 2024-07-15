#!/bin/sh
SCRIPT_PATH="$(dirname $0)"

# Function to check if a command exists
command_exists() {
  command -v "$1" >/dev/null 2>&1
}

# End
echo "######### Start setup for Linux #########"

echo -n "\r\n @@ Detected  OS : "

. /etc/os-release

case $ID in
  ubuntu)
    echo "Ubuntu !\r\n"

    echo "Update OS..."
    sudo apt-get update
    sudo apt-get -y dist-upgrade

    # Install zsh if not installed (required for the next step)
    if ! command_exists zsh; then
      echo "zsh not found, installing..."
      sudo apt-get -y install zsh
      sudo chsh -s $(which zsh) $USER
      touch ~/.zshrc
    else
      echo "zsh is already installed."
    fi

    chmod +x "$SCRIPT_PATH/install-ubuntu.zsh"
    echo "\r\nLaunching script 'install-ubuntu.zsh' with zsh...";
    exec zsh -c 'exec ./install-ubuntu.zsh'
    ;;

  arch)
    echo "Arch Linux !\r\n"

    echo "Update OS..."
    sudo pacman -Syu

    # Install zsh if not installed (required for the next step)
    if ! command_exists zsh; then
      echo "zsh not found, installing..."
      sudo pacman -S zsh
      sudo chsh -s $(which zsh) $USER
      touch ~/.zshrc
    else
      echo "zsh is already installed."
    fi

    echo "\r\nLaunching script 'install-ubuntu.sh' with zsh...";
    chmod +x "$SCRIPT_PATH/install-ubuntu.sh"
    zsh "$SCRIPT_PATH/install-ubuntu.sh"
    ;;

  ol)
    echo "OracleLinux !\r\n"

    # Install zsh if not installed (required for the next step)
    if ! command_exists zsh; then
      echo "zsh not found, installing..."
      sudo dnf install zsh -y
      sudo chsh -s $(which zsh) $USER
      touch ~/.zshrc
    else
      echo "zsh is already installed."
    fi

    echo "\r\nLaunching script 'install-ubuntu.sh' with zsh...";
    chmod +x "$SCRIPT_PATH/install-ubuntu.zsh"
    zsh "$SCRIPT_PATH/install-ubuntu.zsh"
    ;;

  *) echo "This is an unknown distribution : $ID"
      ;;
esac

exit
