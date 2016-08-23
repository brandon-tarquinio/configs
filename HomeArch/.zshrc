# Path to your oh-my-zsh installation.
export ZSH=/home/tarqub/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="honukai"
#"robbyrussell"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
 COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git archlinux gnu-utils gradle man vi-mode)

# User configuration

# export PATH="/usr/bin:/bin:/usr/sbin:/sbin:$PATH"
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
export LANG=en_US.UTF-8
export LC_MESSAGES=C
export TERM=xterm-256color

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
export ARCHFLAGS="-arch x86_64"

# ssh
export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
alias zshconfig="vim ~/.zshrc"
alias ohmyzsh="vim ~/.oh-my-zsh"

#Lines configured by ME
archey3
#Activate Zsh-syntax-highlighting
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
#Prompt
#	autoload -U promptinit
#	promptinit
#	autoload -U colors && colors
#	PROMPT="%{$fg[green]%}%n%{$reset_color%}[%{$fg[red]%}%T%{$reset_color%}] %{$fg[cyan]%}%~ %{$reset_color%}%# "
#Command Not Found hook
	source /usr/share/doc/pkgfile/command-not-found.zsh
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
    alias rm=' timeout 3 rm -iv --one-file-system'    
    #Pacman
    alias pacin='sudo pacman -S '
    alias pacup='sudo pacman -Syu --ignore protobuf'
    alias pacout='sudo pacman -Rsn '
    #Top
    alias free='free -h' 
    #Python
	#alias python='python2.7'
	#Ping
	alias ping='ping -c 3 www.google.com'
	#Vim
	alias vi='vim'
	#LightTable
#	 alias lighttable='~/LightTable/LightTable'
