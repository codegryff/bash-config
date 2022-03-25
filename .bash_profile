#!/bin/bash

# ============================================
# BASH PROMPT (PS1)
# ============================================
function __set_ps1()
{
    local __EXIT_STATUS=$?
    local __PS1="\n"


    # == USERNAME@HOST == #
    #region
    __PS1+='\[\e[1;90m\]'"("'\[\e[m\]'
    __PS1+='\[\e[0;96m\]'"\u@\h"'\[\e[0;96m\]'
    __PS1+='\[\e[1;90m\]'")"'\[\e[m\]'
    #endregion


    # == TIME == #
    #region
    __PS1+='\[\e[1;90m\]'"―->("'\[\e[m\]'
    __PS1+='\[\e[0;93m\]'"$(date +%Y-%b-%d\ %T\ %:z)"'\[\e[m\]'
    __PS1+='\[\e[1;90m\]'")"'\[\e[m\]'
    #endregion


    # == PWD == #
    #region
    __PS1+='\[\e[1;90m\]'"――>("'\[\e[m\]'
    __PS1+='\[\e[0;94m\]'"$(pwd)"/'\[\e[0;94m\]'
    __PS1+='\[\e[1;90m\]'")"'\[\e[m\]'
    #endregion


    # == GIT == #
    #region
    if [ $(git rev-parse --is-inside-work-tree 2>/dev/null) ]; then
        __PS1+='\[\e[1;90m\]'"――>("'\[\e[m\]'
        __PS1+='\[\e[0;44m\]'"$(git branch --show-current)"'\[\e[m\]'
        __PS1+='\[\e[1;90m\]'")"'\[\e[m\]'
    fi
    #endregion


    # == PREVIOUS STATUS == #
    #region
    __PS1+='\[\e[1;90m\]'"――>("'\[\e[m\]'
    if [ ${__EXIT_STATUS} -eq 0 ]; then
       __PS1+='\[\e[0;32m\]' # success
    else
       __PS1+='\[\e[0;31m\]' # error
    fi
    __PS1+="${__EXIT_STATUS}"'\[\e[m\]'
    __PS1+='\[\e[1;90m\]'")"'\[\e[m\]'
    #endregion


    # == VIRTUAL_ENV == #
    #region
    if [ -n "$VIRTUAL_ENV" ]; then
        # == VIRTUAL_ENV == #
        __PS1+="\n"
        __PS1+='\[\e[1;30;42m\]'"(${VIRTUAL_ENV})"'\[\e[m\]'
    fi
    #endregion


    __PS1+="\n\$ "
    export PS1="${__PS1}"
}
PROMPT_COMMAND='__set_ps1'
# ============================================


HISTSIZE=20
HISTFILESIZE=1000


# ============================================
# ALIASES
# ============================================
alias aptfu='sudo apt full-upgrade'
alias aptuu='sudo snap refresh; sudo apt update -y && sudo apt upgrade -y && sudo apt autoremove -y --purge'
alias cp='cp --verbose'
alias grep='grep --color=auto'
alias histgrep='cat ~/.bash_history | grep'
alias ls='ls --color=always --human-readable -lo'
alias lsa='ls --almost-all'
alias mkdir='mkdir --verbose --parents'
alias mv='mv --verbose'
alias rename='rename --verbose'
alias rm='rm --verbose'
alias vscode='code ./'
# ============================================


# DIRECTORIES
# ============================================
alias dotfiles='cd ~/.dotfiles'
# ============================================


# ============================================
# PYTHON
# ============================================
export PIPENV_VENV_IN_PROJECT=1;
alias python='python3'
alias pipenv='python -m pipenv'
# ============================================
