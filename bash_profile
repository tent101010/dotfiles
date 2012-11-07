source $HOME/.bashrc

# make ls command pretty
export CLICOLOR=1

export HISTSIZE=2000

export PS1="\u \W\$ "

# Setting PATH for MacPython 2.6
# The orginal version is saved in .bash_profile.pysave
#PATH="/Library/Frameworks/Python.framework/Versions/2.6/bin:${PATH}"
#export PATH

# setdsm sets the DJANGO_SETTINGS_MODULE to the settings.py in the current 
# directory and adds the current directory and it’s parent to PYTHONPATH.
# RoastLog Django app example:
# 0. echo $PYTHONPATH and echo $DJANGO_SETTINGS_MODULE to see if things are
#    already set the way you want them. If not, carry on.
# 1. cd /Users/apejoy/dev/roastlog.git/src/www/roastlog/settings
# 2. setdsm ryan

function setdsm() {
# add the current directory and the parent directory to PYTHONPATH
# sets DJANGO_SETTINGS_MODULE
    export PYTHONPATH=$PYTHONPATH:$PWD/..
    export PYTHONPATH=$PYTHONPATH:$PWD
    if [ -z "$1" ]; then 
        x=${PWD/\/[^\/]*\/}
        export DJANGO_SETTINGS_MODULE=$x.settings
    else    
        export DJANGO_SETTINGS_MODULE=$1
    fi

    echo "DJANGO_SETTINGS_MODULE set to $DJANGO_SETTINGS_MODULE"
}
