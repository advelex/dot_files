#-------------------------------------------------------------
# Source global definitions (if any)
#-------------------------------------------------------------


if [ -f /etc/bashrc ]; then
      . /etc/bashrc   # --> Read /etc/bashrc, if present.
fi

# Use vi style editing in terminal
set -o vi

# Some aliases
alias octave='octave --no-window'

# custom bash prompt
PROMPT_COMMAND='hasjobs=$(jobs -p)'
export PS1='\[\e[90m\]\[\e[1m\]\u ${hasjobs:+\[\e[0m\]\[\e[38;5;104m\][\j] }\[\e[0m\]\[\e[94m\]\w\n\[\e[38;5;202m\]\[\e[1m\]$ \[\e[0m\]'


# Read local bash settings if they exist
if [ -f $HOME/.local_bashrc ]; then
      . $HOME/.local_bashrc 
fi
