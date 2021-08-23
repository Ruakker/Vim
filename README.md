# Vim
My Vim Config

~~因为没有梯子的时候访问不了 private gist，所以只能丢一个在 github 的公开仓库里~~

## Requirements

- git
- nodejs
- LLVM

## Install

For Windows,just run

```powershell
iwr -useb https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim |`
    ni "$(@($env:XDG_DATA_HOME, $env:LOCALAPPDATA)[$null -eq $env:XDG_DATA_HOME])/nvim-data/site/autoload/plug.vim" -Force
```

in Powershell to install vim-plug in Neovim.

And the Gvim:

```powershell
iwr -useb https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim |`
    ni $HOME/vimfiles/autoload/plug.vim -Force
```

## The location of the init.vim and \_vimrc

Neovim:

`~/.config/nvim/init.vim`

Vim:

`~/_vimrc`
