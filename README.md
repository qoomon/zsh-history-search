# zsh-history-fzf

## Install

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
