#!/usr/bin/env bash
# Symlink this repo's dotfiles into $HOME. Existing files are backed up first.
set -euo pipefail

DOTFILES="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BACKUP="$HOME/.dotfiles-backup-$(date +%Y%m%d-%H%M%S)"

link() {
  local src="$1" dest="$2"
  if [ -e "$dest" ] || [ -L "$dest" ]; then
    if [ "$(readlink -f "$dest" 2>/dev/null)" = "$src" ]; then
      echo "  ok    $dest"
      return
    fi
    mkdir -p "$BACKUP/$(dirname "${dest#$HOME/}")"
    mv "$dest" "$BACKUP/${dest#$HOME/}"
    echo "  saved $dest -> $BACKUP/${dest#$HOME/}"
  fi
  mkdir -p "$(dirname "$dest")"
  ln -s "$src" "$dest"
  echo "  link  $dest"
}

echo "linking home dotfiles:"
for f in .zshrc .zshenv .bashrc .p10k.zsh .gitconfig; do
  [ -e "$DOTFILES/$f" ] && link "$DOTFILES/$f" "$HOME/$f"
done

echo "linking ~/.config:"
for d in "$DOTFILES"/config/*; do
  link "$d" "$HOME/.config/$(basename "$d")"
done

echo "linking ~/.local/bin:"
for f in "$DOTFILES"/local/bin/*; do
  link "$f" "$HOME/.local/bin/$(basename "$f")"
done

[ -d "$BACKUP" ] && echo "backups in $BACKUP"
echo "done. restart your shell."
