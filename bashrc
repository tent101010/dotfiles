# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# User specific aliases and functions
if [ -f $HOME/.profile ]; then
    . $HOME/.profile
fi
# Key bindings
if [ -f $HOME/.bash_key_bindings ]; then
    bind -f $HOME/.bash_key_bindings
fi

# Git autocomplete
if [ -f $HOME/.git-completion ]; then
    . $HOME/.git-completion
fi

PYTHONBIN="/System/Library/Frameworks/Python.framework/Versions/2.7/bin"

# Virtualenv wrappers.  Make sure this directory has been
# created already.
export WORKON_HOME=$HOME/.virtualenvs
if [ ! -d $WORKON_HOME ]; then
    mkdir $WORKON_HOME
fi

if [ -f /usr/local/bin/virtualenvwrapper.sh ]; then
    . /usr/local/bin/virtualenvwrapper.sh
fi
# This is required to build certain things on OSX 10.6+
# export ARCHFLAGS="-arch i386 -arch x86_64"

# Pip
export PIP_RESPECT_VIRTUALENV=true
# pip bash completion start
_pip_completion()
{
    COMPREPLY=( $( COMP_WORDS="${COMP_WORDS[*]}" \
        COMP_CWORD=$COMP_CWORD \
        PIP_AUTO_COMPLETE=1
    $1 ) )
}
complete -o default -F _pip_completion pip
# pip bash completion end

export HISTFILESIZE=3000
export LSCOLORS=cxfxcxdxbxegedabagacad

export COPENSTACK_COMPUTE_USERNAME="TODO"
export COPENSTACK_COMPUTE_API_KEY="TODO"

# Add a few things
PATH=$PATH:$HOME/bin:/usr/local/bin:$PYTHONBIN:/usr/local/git/bin/

# For macports...this should be the last item to
# modify the path
#export MANPATH=/opt/local/share/man:$MANPATH:/usr/local/mysql/man

# Java/Hadoop
#JAVA_HOME=/System/Library/Frameworks/JavaVM.framework/Versions/CurrentJDK/Home

# Add the git state into the prompt
export PS1='\u@\h $(__git_ps1 "(%s)")\$ '

export TERM=xterm-color
export SVN_EDITOR=vim
export EDITOR=vim

# Screen stuff
alias screen='TERM=screen screen'

### my aliases
alias ls='ls -G'
alias l='ls -lF'
alias la='ls -alF'
alias lt='ls -lFt'
alias p='pwd'
alias v='vim'
alias c='clear'
alias cd..='cd ..'
alias gpp='g++'
alias updb='sudo /usr/libexec/locate.updatedb'
alias stopmysql='sudo launchctl unload -w /Library/LaunchDaemons/com.mysql.mysqld.plist'
alias startmysql='sudo launchctl load -w /Library/LaunchDaemons/com.mysql.mysqld.plist'
alias startmemcache='sudo launchctl load -w /Library/LaunchDaemons/org.macports.memcached.plist'
alias stopmemcache='sudo launchctl unload -w /Library/LaunchDaemons/org.macports.memcached.plist'
alias startmongo='sudo mongod --fork --dbpath /usr/local/mongodb/data --logpath /var/log/mongod.log --logappend'
alias zetta='cd ~/Sites/zetta/ZettaPublicSite.git'
alias runRoastlogLocalhost='python /Users/ape/dev/roastlog/src/www/roastlog/manage.py runserver --settings=settings.ryan'
alias runclog='python /Users/ape/dev/cuplog/src/www/cuplog/manage.py runserver 0.0.0.0:8001 --settings=settings.ryan'
alias rlAllNet='python ~/dev/roastlog/src/www/roastlog/manage.py runserver 0.0.0.0:8000 --settings=settings.ryan'
alias rls='cd ~/dev/roastlog/src/www/roastlog'
alias rlog='cd ~/dev/roastlog'
alias clog='cd ~/dev/cuplog'
alias brower='cd ~/Sites/brower.com/brower.com.git/'
alias imgdim='sips -g pixelHeight -g pixelWidth $1'
# some useful git aliases
alias rbi='git rb origin/inventory-dev'
alias gpom='git push origin master'
alias rbm='git rebase origin/master'
alias gf='git fetch -v'

if [ -d /usr/local/Cellar/clojure-contrib/1.2.0 ];
then
    export
    CLASSPATH=$CLASSPATH:/usr/local/Cellar/clojure-contrib/1.2.0/clojure-contrib.jar
fi

function grepsrc () {
    find . -name "$1" | xargs egrep "$2";
}

# EOF
