# dev-env

This repository contains my development environment configurations for Linux, Mac, and Windows, including terminal and Visual Studio Code settings.

## Directory Structure

- `Linux/`: Configurations for Linux.
- `Mac/`: Configurations for Mac.
- `Windows/`: Configurations for Windows.

Each directory contains subdirectories for terminal and VS Code configurations.

## Usage

To set up your terminal and VS Code environnement you can create symbolic links :

### Linux

#### Terminal setup : 

```sh
ln -sf $(pwd)/Linux/terminal/.bashrc ~/.bashrc
ln -sf $(pwd)/Linux/terminal/.zshrc ~/.zshrc
ln -sf $(pwd)/Linux/terminal/config.json ~/.config/terminal/config.json
```

#### VS Code setup:

```sh
ln -sf $(pwd)/Linux/vscode/settings.json ~/.config/Code/User/settings.json
ln -sf $(pwd)/Linux/vscode/extensions.json ~/.config/Code/User/extensions.json
```

### Mac

#### Terminal setup: 

```sh
ln -sf $(pwd)/Mac/terminal/.bash_profile ~/.bash_profile
ln -sf $(pwd)/Mac/terminal/.zshrc ~/.zshrc
ln -sf $(pwd)/Mac/terminal/config.json ~/.config/terminal/config.json
```

#### VS Code setup:

```sh
ln -sf $(pwd)/Mac/vscode/settings.json ~/Library/Application\ Support/Code/User/settings.json
ln -sf $(pwd)/Mac/vscode/extensions.json ~/Library/Application\ Support/Code/User/extensions.json
```

### Windows (PowerShell)

#### Terminal setup:

```sh
New-Item -ItemType SymbolicLink -Path $PROFILE -Target $(Resolve-Path Windows/terminal/PowerShell_profile.ps1)
```

#### VS Code Setup:

```sh
New-Item -ItemType SymbolicLink -Path "$env:APPDATA\Code\User\settings.json" -Target $(Resolve-Path Windows/vscode/settings.json)
New-Item -ItemType SymbolicLink -Path "$env:APPDATA\Code\User\extensions.json" -Target $(Resolve-Path Windows/vscode/extensions.json)
```

### Contributions

Contributions are welcome! Feel free to propose improvements via pull requests.