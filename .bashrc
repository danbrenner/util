# ~/.bashrc

# disable mapping of ^s to flow control so forward-i-search works as easily as reverse-i-search (^r)
stty -ixon

# prompt
export PS1='\u@\h: [\W]\$ '

# editor
export EDITOR=vim

# colors
export CLICOLOR=1
export LSCOLORS='geehcxdxbxfxexabhbacgc'
export LS_COLORS='di=36;44:ln=34;47:so=32;40:pi=33;40:ex=31;40:bd=35;40:cd=34;40:su=0;41:sg=37;41:tw=0;42:ow=36;42:'
export GREP_OPTIONS='--color=auto'

# history
export HISTFILESIZE=1000000000 # more history
export HISTSIZE=1000000 # more history
export HISTTIMEFORMAT='%F %T ' # timestamps
export HISTCONTROL=ignoredups # ignore duplicates in history

# command aliases
alias app="open -a" # open file
alias finder="open -a Finder $1" # open specified directory with Finder
alias bbe="open -a BBEdit $1" # open specified file with BBEdit
alias freespace="df -h" # show available disk space
alias lh="ls -lah" # directory listing of all items in human-readable format
alias sx="screen -x" # attach to screen session
alias sls="screen -ls" # list screen sessions
alias c="clear" # clear display
alias vi="vim" # make vi load vim
alias refressh="export SSH_AUTH_SOCK=$(find /tmp -maxdepth 2 -type s -name "agent*" -user $USER -printf '%T@ %p\n' 2>/dev/null |sort -n|tail -1|cut -d' ' -f2)" # refresh stale ssh sockets (useful when using git in screen), "exec bash" before using this command

# ssh aliases
alias s_server="ssh -i ~/.ssh/id_rsa_{IDENTITY} username@server.com"

# vnc (via ssh tunnel) aliases
alias v_server="ssh -f -p {SSH_PORT} -i ~/.ssh/id_rsa_{IDENTITY} -L {LOCAL_VNC_PORT_TO_MAP}:localhost:{REMOTE_VNC_PORT} username@$(cat ~/Dropbox/ip_home.txt) sleep 10; open vnc://username@localhost:{LOCAL_VNC_PORT_TO_MAP}"

# sounds
alias horn="afplay ~/Dropbox/sound\ effects/air_horn.wav >/dev/null 2>&1 </dev/null &"
alias laser="afplay ~/Dropbox/sound\ effects/laser_shots.mp3 >/dev/null 2>&1 </dev/null &"
alias sonar="afplay ~/Dropbox/sound\ effects/dub_sonar.wav >/dev/null 2>&1 </dev/null &"
alias roar="afplay ~/Dropbox/sound\ effects/lion.mp3 >/dev/null 2>&1 </dev/null &"

# make commands use colors
alias less='less -R'
alias ls='ls --color'

# functions
phplines() {
	# recursively count all lines in php files within current dir, filtered by extension given as first param
	( find ./ -name '*.php' -print0 | xargs -0 cat ) | wc -l;
}
sn() {
	# make screen session with specified name, start shell, and attach to it
	echo 'starting screen session...';
	screen -S $1 -d -m -t shell bash;
	screen -x $1;
}
