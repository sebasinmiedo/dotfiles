````markdown
# Dotfiles de Sebitas

Este repositorio contiene mis configuraciones personales para Arch Linux, incluyendo:

- i3  
- Polybar  
- Kitty  
- Neovim  
- Starship prompt  
- Zsh  

Todas estas configuraciones están organizadas dentro de `~/.config` y `.zshrc` para ser fácilmente desplegadas en cualquier sistema mediante enlaces simbólicos.

---

## Instalación

Clonar el repositorio:

```bash
git clone https://github.com/tuusuario/dotfiles.git ~/dotfiles
````

Crear enlaces simbólicos:

```bash
ln -s ~/dotfiles/.config/nvim ~/.config/nvim
ln -s ~/dotfiles/.config/i3 ~/.config/i3
ln -s ~/dotfiles/.config/polybar ~/.config/polybar
ln -s ~/dotfiles/.config/kitty ~/.config/kitty
ln -s ~/dotfiles/.config/starship.toml ~/.config/starship.toml
ln -s ~/dotfiles/.zshrc ~/.zshrc
```

> ⚠️ Haz backup de tus archivos actuales antes de reemplazarlos.

---

## Créditos

Algunas configuraciones fueron inspiradas o tomadas de los siguientes repositorios:

* [kickstart.nvim](https://github.com/nvim-lua/kickstart.nvim) – Base para mi configuración de Neovim
* [polybar-themes](https://github.com/adi1090x/polybar-themes/tree/master) – Temas y bloques de Polybar
* Otros proyectos open source cuyos autores se mencionan en los archivos originales

---

## Notas

* Los archivos `.git` de los repositorios originales fueron eliminados.
* Este repo tiene como objetivo **mantener mis dotfiles organizados y versionados**, no redistribuir los proyectos originales.
* Se recomienda revisar los archivos y adaptarlos según tu propio sistema antes de usarlos.

```
```

