# shellcheck disable=SC1094

# https://github.com/git/git/blob/master/contrib/completion/git-completion.bash
if [ -f ~/.git-completion.bash ]; then
    . ~/.git-completion.bash
fi

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# Check for colour support
if [[ -x /usr/bin/tput ]] && tput colors &> /dev/null; then
	color_prompt='yes'
else
	color_prompt=
fi

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

export TERM=xterm-256color

if [[ $color_prompt == 'yes' ]]; then
	. "$HOME"/.prompt.bash
	PROMPT_COMMAND="set_prompt${PROMPT_COMMAND:+$'\n'$PROMPT_COMMAND}"
else
	PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt

# ----- Key presses -----
#
# Prevents EOF (ctrl-d) from exiting shell
set -o ignoreeof

# Key bindings
bind '"\e[1;3A": end-of-line'
bind '"\e[1;3B": end-of-line'
bind '"\e[1;3C": end-of-line'
bind '"\e[1;3D": end-of-line'

# Last step, read local settings
if [ -f ~/.bashrc_local ]; then
    . ~/.bashrc_local
fi
