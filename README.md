# 🚀 Dotfiles

My personal configuration files for a minimal and aesthetic Linux setup.

## 📋 Overview

This repository contains configuration files for various applications and tools I use daily. The setup is centered around **Hyprland** (Wayland compositor) with a carefully curated selection of tools for a productive development environment.

## 🎨 Features

- **Window Manager**: Hyprland (Wayland compositor)
- **Status Bar**: Waybar
- **Launcher**: Wofi
- **Terminal Emulators**: Kitty & Ghostty
- **Text Editor**: Neovim
- **Shell**: Zsh
- **Terminal Multiplexer**: Tmux
- **Lock Screen**: Hyprlock
- **Wallpaper Manager**: Hyprpaper
- **Widgets**: EWW (ElKowar's Wacky Widgets)
- **Color Scheme**: Catppuccin Mocha theme

## 📁 Structure

```
dotfiles/
├── backgrounds/      # Wallpapers and background images
├── eww/             # EWW widget configurations
├── ghostty/         # Ghostty terminal config
├── git/             # Git configuration
├── hypr/            # Hyprland window manager config
├── hyprlock/        # Hyprlock screen locker config
├── hyprmocha/       # Hyprland Mocha theme
├── hyprpaper/       # Hyprpaper wallpaper daemon config
├── kitty/           # Kitty terminal config
├── nvim/            # Neovim configuration
├── sddm/            # Boot login screen theme
├── tmux/            # Tmux configuration
├── waybar/          # Waybar status bar config
├── wofi/            # Wofi launcher config
└── zsh/             # Zsh shell configuration
```

## 🔧 Installation

### Prerequisites

Make sure you have the following packages installed:

```bash
# Core components
sudo pacman -S hyprland waybar wofi kitty neovim zsh tmux git

# Optional components
sudo pacman -S hyprlock hyprpaper eww ghostty
```

### Clone the Repository

```bash
git clone https://github.com/AdityaTote/dotfiles.git ~/dotfiles
cd ~/dotfiles
```

### Setup Configuration Files

You can use GNU Stow or manually symlink the configuration files:

#### Using Stow (Recommended)

```bash
# Install stow if not already installed
sudo pacman -S stow

# Stow individual configs
stow hypr
stow waybar
stow kitty
stow nvim
stow zsh
# ... repeat for other directories
```

The SDDM boot theme must be copied to a system directory instead of stowed because the SDDM user cannot read a private home directory:

```bash
sudo sh sddm/install.sh
```

#### Manual Symlinking

```bash
# Example for Hyprland
ln -sf ~/dotfiles/hypr/.config/* ~/.config/

# Example for Zsh
ln -sf ~/dotfiles/zsh/.zshrc ~/.zshrc

# Repeat for other configurations as needed
```

## ⚙️ Configuration

### Hyprland

The Hyprland configuration includes:

- Custom keybindings for window management
- Workspace rules and layouts
- Animation settings
- Auto-start applications

### Neovim

Modern Neovim setup with LSP, treesitter, and various plugins for an IDE-like experience.

### Zsh

Enhanced shell experience with custom aliases, functions, and prompt.

### Waybar

Customized status bar with system information, workspace indicators, and more.

## 🎨 Theme

The configuration uses the **Catppuccin Mocha** color scheme for a consistent and pleasant aesthetic across all applications.

## 🚀 Usage

After installation:

1. Log out of your current session
2. Select Hyprland from your display manager
3. Log in and enjoy your new setup!

### Key Bindings

Check the Hyprland configuration for custom keybindings. Common ones include:

- `Super + Enter` - Open terminal
- `Super + D` - Open application launcher
- `Super + Q` - Close window
- `Super + [1-9]` - Switch workspaces

(Refer to `hypr/.config/hyprland.conf` for complete keybindings)

## 🛠️ Customization

Feel free to customize any configuration to suit your preferences. Each directory contains well-commented configuration files.

## 📝 Notes

- These configurations are tailored for my personal workflow
- Some configurations may require adjustments based on your system
- Make sure to back up your existing configs before applying these

## 🤝 Contributing

Feel free to fork this repository and adapt it to your needs. If you find any issues or have suggestions, please open an issue or pull request.

## 📄 License

This repository is available as open source under the terms of the [MIT License](LICENSE).

## 🙏 Acknowledgments

- [Hyprland](https://hyprland.org/) - Amazing Wayland compositor
- [Catppuccin](https://github.com/catppuccin) - Beautiful color scheme
- The entire Linux and open-source community

---

**Note**: This is a work in progress and configurations may change over time.
