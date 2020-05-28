set_prompt()  {
	# Exit status of last command
	local exit_status=$?

	# Colours
    # note: May 2020: colours above 7 are not working
	local red green yellow blue magenta cyan orange grey violet lgrey no_colour
	red=$(tput setaf 1)
	green=$(tput setaf 2)
	yellow=$(tput setaf 3)
	blue=$(tput setaf 4)
	magenta=$(tput setaf 5)
	cyan=$(tput setaf 6)
	orange=$(tput setaf 9)
	grey=$(tput setaf 10)
	violet=$(tput setaf 13)
	lgrey=$(tput setaf 14)
	no_colour=$(tput sgr0)

	PS1=

    # virtualenv
    if [[ $VIRTUAL_ENV != "" ]]
    then
        __venv="${VIRTUAL_ENV##*/}"
        PS1+="\\[$blue\\](${__venv}) "
        # Strip out the path and just leave the env name
    fi

    # git
	local git_dir
	if git_dir=$(git rev-parse --git-dir 2> /dev/null); then

		PS1+="\\[$grey\\]"

		# Get current branch or just use ".git" if in git directory
		if [[ $(git rev-parse --is-inside-git-dir) == 'true' ]]; then
			# Or is it even a bare repo?
			if [[ $(git rev-parse --is-bare-repository) == 'true' ]]; then
				PS1+='bare'
			else
				PS1+='.git'
			fi

		elif [[ -f $(git rev-parse --show-toplevel)/.git ]]; then
			# We are in a submodule
			__submodname=$(< "$(git rev-parse --show-toplevel)/.git")
			__submodname=${__submodname##*/}
			PS1+="(\\[$lgrey\\]$__submodname\\[$grey\\])"
		elif __bname=$(git symbolic-ref -q --short HEAD); then
			# Use variable instead of assigning directly because of expansions vulnerability
			PS1+="\\[$yellow\\]\${__bname}"
			local space=" "

			# Unstaged changes
			local uscct
			if uscct=$(git status --porcelain | grep -c '^.[MD]'); then
				((uscct == 1)) && uscct=
				PS1+="${space:-"\\[$grey\\]|"}\\[$orange\\]$uscct"$'\xe2\x96\xb3'
				space=""
			fi

			# Staged changes
			local scct
			if scct=$(git status --porcelain | grep -c '^[MADRC]'); then
				((scct == 1)) && scct=
				PS1+="${space:-"\\[$grey\\]|"}\\[$orange\\]$scct"$'\xe2\x96\xb2'
				space=""
			fi

		else
			# Probably detached HEAD, use describe or commit hash
			# Use variable instead of assigning directly because of expansions vulnerability
			PS1+="\\[$lgrey\\]"
			if __bname=$(git describe --tags HEAD 2> /dev/null); then
				PS1+='${__bname}'
			else
				PS1+=$(git rev-parse --short HEAD)
			fi

		fi
		PS1+="\\[$grey\\] "
	fi

	# If user name has multiple parts, shorten to 'a_b' or similar; else just use first letter
	local suff
	__un=${USER:0:1}
	if [[ $USER == *?[-._]?* ]]; then
		suff=${USER#*[-._]}
		__un+=${USER:$((${#USER} - ${#suff} - 1)):1}${suff:0:1}
	fi

	# If host name has multiple parts, shorten to 'a-b' or similar; else just use first letter
	__hn=${HOSTNAME:0:1}
	if [[ $HOSTNAME == *?[-._]?* ]]; then
		suff=${HOSTNAME#*[-._]}
		__hn+=${HOSTNAME:$((${#HOSTNAME} - ${#suff} - 1)):1}${suff:0:1}
	fi

	# If $PWD starts with $HOME, replace the $HOME part with a tilde
	if [[ $PWD == "$HOME"* ]]; then
		__cwd="~${PWD:${#HOME}}"
	else
		__cwd=$PWD
	fi

	local sign_col
	# Colour for prompt sign
	if ((exit_status == 0)); then
		sign_col=$green
	else
		sign_col=$red
	fi

	# Set rest of prompt
	#PS1+="\\[$orange\\]\$__un\\[$blue\\]@\\[$yellow\\]\$__hn\\[$orange\\]:\\[$violet\\]\$__cwd\\[$sign_col\\]\\$\\[$no_colour\\] "
	PS1+="\\[$cyan\\]\${USER} \\[$violet\\]\$__cwd\\[$sign_col\\]\n\\$\\[$no_colour\\] "
}
