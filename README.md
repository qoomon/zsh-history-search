# zsh-history-search

## Features

* Search for History Commands
  * `CTRL + R` (`_history_search_widget`)
* Search or Complete History Arguments
  * `CTRL + SPACE` (`_history_search_argument_widget`)

## Install
#### Requirements
* Installed [fzf](https://github.com/junegunn/fzf
  
#### Install This Plugin
  ###### [zgem](https://github.com/qoomon/zgem)
  `zgem bundle 'https://github.com/qoomon/zsh-history-search.git' from:'git' use:'zsh-history-search.zsh'`
  ###### [zplug](https://github.com/zdharma/zplugin)
  `zplug qoomon/zsh-history-search`
  ###### [zgen](https://github.com/tarjoilija/zgen)
  ```
  zgen load qoomon/zsh-history-search
  zgen save
  ```
  ###### [Antigen](https://github.com/zsh-users/antigen)
  ```
  antigen bundle qoomon/zsh-history-search
  antigen apply
  ```
  ###### [Oh My ZSH! custom plugin](http://ohmyz.sh/)
  ```
  git clone https://github.com/zsh-history-search/zjump $ZSH_CUSTOM/plugins/zsh-history-search
  plugins+=(k)
  ```
  ###### [zplug](https://github.com/zplug/zplug)
  `zplug "qoomon/zsh-history-search"`
  ###### manually
  ```
  git clone https://github.com/qoomon/zsh-history-search.git
  source zsh-history-search/zsh-history-search.zsh
  ```

#### Configuration

* `HISTORY_ARGUMENT_SEARCH_LIMIT=1000` 
  * Adjust how many history commands should be considered for argument search

