#!/bin/zsh
SCRIPT_PATH="$(dirname $0)"
echo "$SCRIPT_PATH"

eval $(/opt/homebrew/bin/brew shellenv)

# Function to check if a command exists
command_exists() {
  command -v "$1" >/dev/null 2>&1
}

# Check if the current terminal is iTerm2
if [[ "$TERM_PROGRAM" == *"iTerm.app"* ]]; then
  echo "Please use this script outside of iTerm2. Switching..."
  open -a Terminal.app $SCRIPT_PATH/uninstall-mac.sh
  pkill -x iTerm
fi

echo "######### Start uninstallation #########"

echo "\n@@ Uninstall Visual Studio Code :\n"

# Remove Visual Studio Code (if installed)
if command_exists code; then
  echo "Uninstalling Visual Studio Code..."
  brew uninstall --force visual-studio-code
else
  echo "Visual Studio Code is not installed."
fi

echo "\r\n @@ Reset Terminal settings :\r\n"

rm -rf .oh-my-zsh
rm -rf .p10k.zsh
rm -rf ~/.zsh*
rm -rf ~/.zprofile
rm -rf ~/.zcomp*
touch ~/.zshrc

# Uninstall lsd if installed
if ! command_exists lsd; then
  echo "Uninstalling lsd..."
  brew uninstall lsd
else
  echo "lsd is not installed."
fi

# Remove fonts installed via Homebrew Cask
echo "Uninstalling fonts..."
fonts=(
  "font-hack-nerd-font"
  "font-fira-code-nerd-font"
  "font-meslo-lg-nerd-font"
  "font-jetbrains-mono-nerd-font"
)

for font in "${fonts[@]}"; do
  if brew list --cask | grep -q "$font"; then
    echo "Uninstalling $font..."
    brew uninstall --cask "$font"
  else
    echo "$font is not installed."
  fi
done

# Remove powerlevel10k installation
if command_exists p10k; then
  echo "Uninstalling powerlevel10k..."
  brew uninstall --force powerlevel10k
else
  echo "powerlevel10k is not installed."
fi

# Uninstall iterm if not installed
if brew list --cask | grep -q "iterm2"; then
  echo "iterm2 found, uninstall..."
  brew uninstall iterm2
fi

echo "\r\n @@ Remove packages managers :\r\n"

# Uninstall pnpm if not installed
if brew list --cask | grep -q "pnpm"; then
  echo "pnpm found, uninstall..."
  brew uninstall pnpm
fi

# Uninstall Homebrew (if installed)
if command_exists brew; then
  echo "Uninstalling Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/uninstall.sh)"
  sudo rm -rf "/opt/homebrew"
else
  echo "Homebrew is not installed."
fi

echo "######### End of uninstallation #########"
