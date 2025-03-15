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

PATH=~/bin:~/bin/bin:$PATH
