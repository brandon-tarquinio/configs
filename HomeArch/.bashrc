#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

PS1='[\u@\h \W]\$ '

export TERM=screen-256color
export TERMINAL=termite
export VISUAL=vim
export EDITOR=vim

archey3



#Prompt
#	autoload -U promptinit
#	promptinit
#	autoload -U colors && colors
#	PROMPT="%{$fg[green]%}%n%{$reset_color%}[%{$fg[red]%}%T%{$reset_color%}] %{$fg[cyan]%}%~ %{$reset_color%}%# "
#Command Not Found hook
#	source /usr/share/doc/pkgfile/command-not-found.zsh

#Colored Output
   #ls
    alias ls='ls --color=auto'
    alias lsa='ls -As --block-size=K --color=auto'
    eval $(dircolors -b)
   #Less
    export LESS=-R
    export LESS_TERMCAP_me=$(printf '\e[0m')
    export LESS_TERMCAP_se=$(printf '\e[0m')
    export LESS_TERMCAP_ue=$(printf '\e[0m')
    export LESS_TERMCAP_mb=$(printf '\e[1;32m')
    export LESS_TERMCAP_md=$(printf '\e[1;34m')
    export LESS_TERMCAP_us=$(printf '\e[1;32m')
    export LESS_TERMCAP_so=$(printf '\e[1;44;1m')
    #for code syntax colouring in less
    export LESSOPEN="| /usr/bin/source-highlight-esc.sh %s"
    export LESS='-R '
   #Grep
    alias grep='grep -n --color=auto'
#Aliases
   #mv 
    alias mv=' timeout 8 mv -iv'
   #rm
   # alias rm=' timeout 3 rm -iv --one-file-system'    
   #Pacman
    alias pacin='sudo pacman -S '
    alias pacupg='sudo pacman -Syu '
    alias pacrm='sudo pacman -Rs '
   #Top
    alias free='free -h' 
	#Python
	  alias python='python3.5'
	#Ping
	 alias ping='ping -c 3 www.google.com'
	#Vim
	 alias vi='vim'
	#LightTable
#	 alias lighttable='~/LightTable/LightTable'
