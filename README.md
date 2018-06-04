# zsh-history-fzf
## Usage
 => fzf history search 
``
## Usage

| key            |                                                           |
|---             |---                                                        |
| `ctrl + R`     | search with fzf for history commands                      |
| `ctrl + SPACE` | complete argument with fzf with history command arguments |


## Install

### Requirements
* Installed [fzf](https://github.com/junegunn/fzf)

### [zgem](https://github.com/qoomon/zgem)
`zgem bundle 'https://github.com/qoomon/zsh-history-search.git' from:'git' use:'zsh-history-search.zsh'`
### [zplug](https://github.com/zdharma/zplugin)
`zplug qoomon/zsh-history-search`
### [zgen](https://github.com/tarjoilija/zgen)
```
zgen load qoomon/zsh-history-search
zgen save
```
### [Antigen](https://github.com/zsh-users/antigen)
```
antigen bundle qoomon/zsh-history-search
antigen apply
```
### [Oh My ZSH! custom plugin](http://ohmyz.sh/)
```
git clone https://github.com/qoomon/zjump $ZSH_CUSTOM/plugins/zsh-history-search
plugins+=(k)
```
### [zplug](https://github.com/zplug/zplug)
`zplug "qoomon/zsh-history-search"`
### manually
```
git clone https://github.com/qoomon/zjump.git
source zsh-history-search/zsh-history-search.zsh
```

## Configure
add following snippet to your `.zshrc`
```shell
### Plugin Config - zsh-history-search ###
if type fzf >/dev/null; then
  zle -N _history_widget
  # bind ctrl + r
  bindkey '^R' _history_widget 
  
  zle -N _history_argument_widget
  # bind ctrl + space
  bindkey '^@' _history_argument_widget 
fi
```
