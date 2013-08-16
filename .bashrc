# Define colours
txtblk='\e[0;30m' # Black - Regular
txtred='\e[0;31m' # Red
txtgrn='\e[0;32m' # Green
txtylw='\e[0;33m' # Yellow
txtblu='\e[0;34m' # Blue
txtpur='\e[0;35m' # Purple
txtcyn='\e[0;36m' # Cyan
txtwht='\e[0;37m' # White
bldblk='\e[1;30m' # Black - Bold
bldred='\e[1;31m' # Red
bldgrn='\e[1;32m' # Green
bldylw='\e[1;33m' # Yellow
bldblu='\e[1;34m' # Blue
bldpur='\e[1;35m' # Purple
bldcyn='\e[1;36m' # Cyan
bldwht='\e[1;37m' # White
unkblk='\e[4;30m' # Black - Underline
undred='\e[4;31m' # Red
undgrn='\e[4;32m' # Green
undylw='\e[4;33m' # Yellow
undblu='\e[4;34m' # Blue
undpur='\e[4;35m' # Purple
undcyn='\e[4;36m' # Cyan
undwht='\e[4;37m' # White
bakblk='\e[40m'   # Black - Background
bakred='\e[41m'   # Red
badgrn='\e[42m'   # Green
bakylw='\e[43m'   # Yellow
bakblu='\e[44m'   # Blue
bakpur='\e[45m'   # Purple
bakcyn='\e[46m'   # Cyan
bakwht='\e[47m'   # White
txtrst='\e[0m'    # Text Reset

# Set vi keybindings
set -o vi

# Prevent > from accidentally overwriting files. Use >! to force overwriting
set -o noclobber

# Set default umask to remove group and other permissions
umask 0077

# Check for an interactive session
[ -z "$PS1" ] && return

# PS1='[\u@\h \W]\$ '
PS1='\[\033[1;33m\]┌─[\[\033[0m\033[0;34m\]\u\[\033[0m\]@\[\033[00;33m\]\h\[\033[0m\033[1;33m\]] - [\[\033[00;36m\]\t \d\[\033[1;33m\]] - [ \[\033[00;31m\]\w\[\033[1;33m\] ]\n\[\033[1;33m\]└─[\[\033[0m\033[1;33m\]\$\[\033[0m\033[1;33m\]]>\[\033[0m\] '


# Append to history file, don't overwrite it
shopt -s histappend
#HISTCONTROL=ignoreboth
#HISTCONTROL=ignorespace
HISTCONTROL=erasedups:ignorespace
#HISTIGNORE="&:[ ]*:exit"
#HISTIGNORE="cd*:ls*:ll*"
HISTIGNORE="cd*:ls:ls *"
HISTFILESIZE=100000
HISTSIZE=100000

# Colourise ls for filestypes
export CLICOLORS=1
if [ -e /usr/bin/dircolors ]; then
    eval $(dircolors -b ~/.dircolors)
fi

# Colourise ls
#if [ -x /usr/bin/dircolors ]; then
#	eval "`dircolors -b`"
#	alias ls='ls --color=auto'
#fi

# Colourise grep
export GREP_COLOR="01;31"
alias grep='grep --color=auto'

# Lesspipe, allowing less to view archives
LESSOPEN="|lesspipe.sh %s"; export LESSOPEN

# Include /home/hubi/bin in execution path
export PATH=$PATH:/home/hubi/bin/

# Bash completion
if [ -f /etc/bash_completion ]; then
	. /etc/bash_completion
fi

# Aliases in external file
if [ -f ~/.bash_aliases ]; then
	. ~/.bash_aliases
fi

# Make tab completion available for sudo
# complete -cf sudo

export EDITOR=/usr/bin/vim
export GPG_TTY=`tty`
### Added by surfraw. To remove use surfraw-update-path -remove
	export PATH=$PATH:/usr/lib/surfraw
### End surfraw addition.

# coloured man pages
export LESS_TERMCAP_mb=$(printf "\e[1;37m")
export LESS_TERMCAP_md=$(printf "\e[1;37m")
export LESS_TERMCAP_me=$(printf "\e[0m")
export LESS_TERMCAP_se=$(printf "\e[0m")
export LESS_TERMCAP_so=$(printf "\e[1;47;30m")
export LESS_TERMCAP_ue=$(printf "\e[0m")
export LESS_TERMCAP_us=$(printf "\e[0;36m")

# (re)disable colours for env command after setting less colours
function env() {
	exec /usr/bin/env "$@" | grep -v ^LESS_TERMCAP_
}

# rot13() {{{
rot13 () {              # For some reason, rot13 pops up everywhere
	if [ $# -eq 0 ]; then
		tr '[a-m][n-z][A-M][N-Z]' '[n-z][a-m][N-Z][A-M]'
	else
		echo $* | tr '[a-m][n-z][A-M][N-Z]' '[n-z][a-m][N-Z][A-M]'
	fi
}
# }}}

# include git completion
source ~/.git-completion.bash

# include dir in java classpath
export CLASSPATH=$CLASSPATH:/home/hubi/programming/java/ssh_debug/

# powerline
#. /usr/lib/python2.7/site-packages/powerline/bindings/bash/powerline.sh
