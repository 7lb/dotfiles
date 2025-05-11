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
EDITOR=nvim
FZF_DEFAULT_OPTS_FILE=~/.config/fzf/fzfrc

PATH=~/bin:~/bin/bin:$PATH
