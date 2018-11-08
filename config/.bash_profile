# used by tmux
export TERM="xterm-256color"

# terminal interface customization
export CLICOLOR=1                      # enable terminal colors
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx # directory listing colors

# shell prompt formatting style
DEFAULT_COLOR="\[\e[m\]"

TIME_COLOR="\[\e[0;36m\]"
TIME="$TIME_COLOR\t$DEFAULT_COLOR"

FOLDER_COLOR="\[\e[0;35m\]"
FOLDER="$FOLDER_COLOR\w$DEFAULT_COLOR"

BRANCH_COLOR="\[\e[1;32m\]"
BRANCH="$BRANCH_COLOR\$(git branch 2>/dev/null | grep '^*' | colrm 1 2)$DEFAULT_COLOR"

PROMPT_COLOR="\[\e[0;33m\]"
PROMPT="$PROMPT_COLOR\n\\$ $DEFAULT_COLOR"

PS1="\n[$TIME][$FOLDER][$BRANCH]\n$PROMPT_COLOR\\$ $DEFAULT_COLOR"
export PS1

# julia convenience shortcuts
alias jl6="$HOME/Preferences/Applications/Julia/v0.6/usr/bin/julia"
alias jl7="$HOME/Preferences/Applications/Julia/v0.7/usr/bin/julia"
alias jl1="$HOME/Preferences/Applications/Julia/v1.0/usr/bin/julia"
alias jln="$HOME/Preferences/Applications/Julia/nightly/usr/bin/julia"
if [ -d "$HOME/Applications/Julia-1.0.app" ]; then
    alias julia="$HOME/Applications/Julia-1.0.app/Contents/Resources/julia/bin/julia"
else
    alias julia="jl1"
fi
alias jl="julia -q -O3 -g2"

# path additions
export PATH=$PATH:$HOME/Preferences/Applications/LLVM/bin

function Ls()
{
    ls -AlnT $@
}
