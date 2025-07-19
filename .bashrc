#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

source ~/.bashrc_common
source ~/.bashrc_local 2> /dev/null
source ~/.config/broot/launcher/bash/br
source /usr/share/bash-completion/completions/git

PROMPT_COMMAND=buildPrompt
export EDITOR=nvim
export FZF_DEFAULT_OPTS_FILE=~/.config/fzf/fzfrc
export ZK_NOTEBOOK_DIR=~/notes

export PATH=~/bin:~/bin/bin:$PATH
