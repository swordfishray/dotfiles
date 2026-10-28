#!/usr/bin/env bash
# Symlink dotfiles into $HOME (backing up existing files) and install oh-my-zsh + plugins/themes.
set -euo pipefail

DOTFILES="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BACKUP="$HOME/.dotfiles-backup/$(date +%Y%m%d-%H%M%S)"

link() {
  local src="$1" dst="$2"
  if [ -e "$dst" ] && [ "$(readlink -f "$dst")" != "$src" ]; then
    mkdir -p "$BACKUP"
    mv "$dst" "$BACKUP/"
    echo "backed up $dst -> $BACKUP/"
  fi
  ln -sfn "$src" "$dst"
  echo "linked $dst -> $src"
}

clone() {
  local repo="$1" dst="$2"
  [ -d "$dst" ] || git clone --depth=1 "$repo" "$dst"
}

ZSH="${ZSH:-$HOME/.oh-my-zsh}"
ZSH_CUSTOM="${ZSH_CUSTOM:-$ZSH/custom}"
if command -v zsh >/dev/null; then
  clone https://github.com/ohmyzsh/ohmyzsh.git "$ZSH"
  clone https://github.com/zsh-users/zsh-autosuggestions.git "$ZSH_CUSTOM/plugins/zsh-autosuggestions"
  clone https://github.com/zsh-users/zsh-syntax-highlighting.git "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting"
  clone https://github.com/dracula/zsh.git "$ZSH_CUSTOM/themes/dracula"
  ln -sfn "$ZSH_CUSTOM/themes/dracula/dracula.zsh-theme" "$ZSH_CUSTOM/themes/dracula.zsh-theme"
  clone https://github.com/romkatv/powerlevel10k.git "$ZSH_CUSTOM/themes/powerlevel10k"
fi

link "$DOTFILES/bash/.bashrc" "$HOME/.bashrc"
link "$DOTFILES/bash/.bash_profile" "$HOME/.bash_profile"
link "$DOTFILES/bash/.profile" "$HOME/.profile"
link "$DOTFILES/zsh/.zshrc" "$HOME/.zshrc"
