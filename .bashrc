#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

source ~/.bashrc_common
source ~/.bashrc_local 2> /dev/null
source /usr/share/bash-completion/completions/git

PROMPT_COMMAND=buildPrompt
