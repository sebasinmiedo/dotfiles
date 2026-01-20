````markdown
# Sebitas' Dotfiles

This repository contains my personal configurations for Arch Linux, including:

- i3  
- Polybar  
- Kitty  
- Neovim  
- Starship prompt  
- Zsh  

All these configurations are organized under `~/.config` and `.zshrc` for easy deployment on any system using symbolic links.

---

## Installation

Clone the repository:

```bash
git clone https://github.com/yourusername/dotfiles.git ~/dotfiles
````

Create symbolic links:

```bash
ln -s ~/dotfiles/.config/nvim ~/.config/nvim
ln -s ~/dotfiles/.config/i3 ~/.config/i3
ln -s ~/dotfiles/.config/polybar ~/.config/polybar
ln -s ~/dotfiles/.config/kitty ~/.config/kitty
ln -s ~/dotfiles/.config/starship.toml ~/.config/starship.toml
ln -s ~/dotfiles/.zshrc ~/.zshrc
```

> ⚠️ Make a backup of your current files before replacing them.

---

## Credits

Some configurations were inspired by or taken from the following repositories:

* [kickstart.nvim](https://github.com/nvim-lua/kickstart.nvim) – Base for my Neovim configuration
* [polybar-themes](https://github.com/adi1090x/polybar-themes/tree/master) – Polybar themes and blocks
* Other open-source projects whose authors are mentioned in the original files

---

## Notes

* The `.git` directories from the original repositories have been removed.
* This repo aims to **keep my dotfiles organized and versioned**, not to redistribute the original projects.
* It is recommended to review the files and adapt them to your own system before use.
