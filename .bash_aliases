# modified commands

alias ls='ls --color=auto --group-directories-first'
alias ll='ls -lph --group-directories-first'
alias la='ls -a'
alias lr='ls -R'		# recursive
alias lz='ll -rS'		# sort by size
alias lt='ll -rt'		# sort by date
alias lsd='ll | grep "^d"'	# show only directories
alias lds='ls -p | grep "\/"'	# show only directories
alias lsi='ll | grep -i'	# search

# safety features
alias rm='rm -i'
alias mv='mv -i'
alias cp='cp -i'

# new commands
alias hmplayer='mplayer -softvol -softvol-max 800 -volstep 1 -fs -noautosub'
alias hmplayerd='screen -S hmplayerd mplayer -softvol -softvol-max 800 -volstep 1 -fs -noautosub'
alias hfbmplayer='mplayer -softvol -softvol-max 800 -volstep 1 -fs -vo fbdev -vf scale=1280:720'
alias pr0n='mplayer -nosound -fs'
alias hyou='youtube-dl -b -t'
alias links='links -g -driver fb'
alias tt='less ~/misc/timetable'
alias hsensors='sensors | grep Core'
alias gv='gcc -ansi -pedantic -D_POSIX_SOURCE -Wall -Werror'
alias x='startx'
alias xf='xinit full'
alias xd='xinit dwm'
alias xx='xinit xmonad'
#alias srec='ffmpeg -f x11grab -s 2048x1152 -r 10 -i :0.0 -s 2048x1152 -r 10 -sameq'
alias srec='ffmpeg -f x11grab -s 2048x1152 -r 60 -i :0.0 -s 2048x1152 -r 10 -sameq'
alias typetut='xterm -geometry 80x5 -fn '-xos4-terminus-medium-*-*-*-24-*-*-*-*-*-*-*' -e vim '
#alias typetut='xterm -geometry 80x5 -fn '-xos4-terminus-medium-*-*-*-24-*-*-*-*-*-*-*' -e vim ~/ktde.keymaster'
alias dmenuc='dmenu -i -b -nb black -nf orange -sf black -sb orange'
alias lsdvd='lsdvd /dev/sr0'
alias sshs='ssh hubi@192.168.178.28'
alias ytv='python2.7 ~/bin/youtube-dl -t'
alias ytm='python2.7 ~/bin/youtube-dl -t --extract-audio --audio-format=mp3'
alias spc='feh -F ~/misc/secure/pwcard.png'
alias rkb='telnet 192.168.178.53 2323'

# use perl rename instead of standard from util-linux-ng
alias prename='/usr/bin/perlbin/vendor/rename'

# remap capslock to escape
alias killcaps="sudo dumpkeys | sed 's/58 = Caps_Lock/58 = Control/' | sudo loadkeys"

# sudo
alias srb='sudo shutdown -r now'
alias ssd='sudo shutdown -hP'
# make aliases persist with sudo
alias sudo='A=`alias` sudo -E '
# make sudo use environment variables
#alias sudo='sudo -E'
