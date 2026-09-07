# dotfiles

My config files for Linux Mint (Cinnamon) — zsh + kitty + LazyVim.

## What's here

| path | app |
| --- | --- |
| `.zshrc`, `.zshenv`, `.p10k.zsh` | zsh + Powerlevel10k |
| `.bashrc` | bash (fallback shell) |
| `.gitconfig` | git |
| `config/kitty/` | kitty terminal (+ themes) |
| `config/nvim/` | Neovim (LazyVim) |
| `config/btop/`, `config/htop/` | system monitors |
| `config/cava/` | audio visualiser |
| `config/fastfetch/`, `config/neofetch/` | fetch tools |
| `config/glow/` | markdown reader |
| `config/lazygit/` | lazygit |
| `config/picom/` | compositor |
| `config/flameshot/` | screenshots |
| `local/bin/kf` | live kitty font switcher |

`config/` maps to `~/.config/`, `local/bin/` maps to `~/.local/bin/`.

## Install on a new machine

```sh
git clone <this-repo> ~/dotfiles
cd ~/dotfiles
./install.sh
```

`install.sh` symlinks everything into place and backs up anything it would
overwrite to `~/.dotfiles-backup-<timestamp>/`.

## Dependencies (not tracked here)

- oh-my-zsh — `sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"`
- powerlevel10k theme
- LazyVim plugins install themselves on first `nvim` launch (pinned by `lazy-lock.json`)

## Not yet in here

- tmux config (not written yet)
