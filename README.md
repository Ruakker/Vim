# Vim
My [N]Vim Config

~~因为没有梯子的时候访问不了 private gist，所以只能丢一个在 github 的公开仓库里~~

[![Sync to Gitee](https://github.com/Ruakker/Vim/actions/workflows/sync-to-gitee.yml/badge.svg)](https://github.com/Ruakker/Vim/actions/workflows/sync-to-gitee.yml)

## Requirements

- Git
- NodeJS
- LLVM
- CascadiaCode[PL] / FiraCode
- Scoop

## Install

> In Powershell

### Scoop & Code-Minimap

```powershell
Invoke-Expression (New-Object System.Net.WebClient).DownloadString('https://get.scoop.sh')

scoop bucket add extras
```

### Plug.Vim

Neovim

```powershell
iwr -useb https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim |`
    ni "$(@($env:XDG_DATA_HOME, $env:LOCALAPPDATA)[$null -eq $env:XDG_DATA_HOME])/nvim-data/site/autoload/plug.vim" -Force
```

And the Gvim:

```powershell
iwr -useb https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim |`
    ni $HOME/vimfiles/autoload/plug.vim -Force
```

## The location of the init.vim and \_vimrc

Neovim:

`~/AppData/Local/nvim/init.vim`

Vim:

`~/_vimrc`
