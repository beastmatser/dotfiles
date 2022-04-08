# Dotfiles

My personal dotfiles, managed using stow.

```sh
git clone http://github.com/beastmatser/dotfiles && cd dotfiles

# .gitignore does not work with stow, so we'll symlink it manually
ln -s ~/dotfiles/git/.gitignore ~/.gitignore
```
