# dotfiles

## Symlink
Symlink the dotfiles with 
```
sh link.sh
```

# Tools

## Neovim (>= v0.8)
version 0.8 or higher is required for our package manager (Lazy)

## Alacritty

## Tmux

## ZSH

## oh-my-zsh
We need to install the powerlevel10k theme as the .zshrc is configured to use

powerlevel10k: https://github.com/romkatv/powerlevel10k

To update powerlevel10k, pull the repo and restart zsh:
```
git -C ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k pull

```

If the update isn't compatible with the current configuration file, rebuild the config:
```
p10k configure
```
