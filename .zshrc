PROMPT = '%1~%# '

# >>> mamba initialize >>>
# !! Contents within this block are managed by 'mamba init' !!
export MAMBA_EXE="/home/zedr0/.micromamba/bin/micromamba";
export MAMBA_ROOT_PREFIX="/home/zedr0/micromamba";
__mamba_setup="$("$MAMBA_EXE" shell hook --shell zsh --prefix "$MAMBA_ROOT_PREFIX" 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__mamba_setup"
else
    if [ -f "/home/zedr0/micromamba/etc/profile.d/micromamba.sh" ]; then
        . "/home/zedr0/micromamba/etc/profile.d/micromamba.sh"
    else
        export  PATH="/home/zedr0/micromamba/bin:$PATH"  # extra space after export prevents interference from conda init
    fi
fi
unset __mamba_setup
# <<< mamba initialize <<<

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/zedr0/micromamba/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/zedr0/micromamba/etc/profile.d/conda.sh" ]; then
        . "/home/zedr0/micromamba/etc/profile.d/conda.sh"
    else
        export PATH="/home/zedr0/micromamba/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

#
### Zedro's Aliases
#
# Navigation
alias ll='ls -al --color'
# Compiling
alias ccW='cc -Wall -Wextra -Werror'
