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

if [[ $color_prompt == 'yes' ]]; then
	. "$HOME"/.prompt.bash
	PROMPT_COMMAND="set_prompt${PROMPT_COMMAND:+$'\n'$PROMPT_COMMAND}"
else
	PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt

# Prevents EOF (ctrl-d) from exiting shell
set -o ignoreeof

# Last step, read local settings
if [ -f ~/.bashrc_local ]; then
    . ~/.bashrc_local
fi
