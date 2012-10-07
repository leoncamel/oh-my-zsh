
################
#  Function    : add_my_tools ($my_toolset_root)
#  Description : Manipulate the following directory structure.
#  Author      : Leon Zhang
#
# $my_tool_root
# |-- bin
# |-- include
# |-- lib
# |   `-- pkgconfig
# `-- share
#     |-- info
#     `-- man
##

# TODO: unfinished function
function check_path () {
    hash readlink &>/dev/null
    if [ $? -eq 0]; then
        readlink -f $1
    fi
}

# bash style
function strip_path1 () {
    echo "$1" | sed 's#//*#/#g'
}

# zsh only
function strip_path () {
    echo ${1}(:A)
}

function strip_path3 () {
    local p=$1
    /usr/bin/perl -e "use Cwd qw(realpath);print realpath('$p')"
    #python -c "import os,sys;print os.path.realpath('$p')"
    return

    # checking for "readlink -f"
    which readlink && readlink -f / 2&>/dev/null
    if [ $? -eq 0 ]; then
        echo "readlink -f works"
        readlink -f $p
    else
        echo "readlink -f can't work. use perl instead"
        perl -e "use Cwd qw(realpath);print realpath('$p')"
        # alternative : use Python
        # python -c "import os,sys;print os.path.realpath('$p')"
    fi
}

function add_my_tools() {
    local my_toolset_root=$1
    if [ ! -d "$my_toolset_root" ]; then
        echo "The path you specified \"$my_toolset_root\" is not existed"
        echo "    Please check it"

        return
    fi

    if [ -d "$my_toolset_root/bin/" ]; then
        p=$(strip_path "$my_toolset_root/bin")
        export PATH="$p:$PATH"
    fi
    if [ -d "$my_toolset_root/sbin/" ]; then
        p=$(strip_path "$my_toolset_root/sbin")
        export PATH="$p:$PATH"
    fi
    if [ -d "$my_toolset_root/share/man/" ]; then
        p=$(strip_path "$my_toolset_root/share/man")
        export MANPATH="$p:$MANPATH"
    fi
    if [ -d "$my_toolset_root/share/info/" ]; then
        p=$(strip_path "$my_toolset_root/share/info")
        export INFOPATH="$p:$INFOPATH"
    fi

    # TODO: check if there is a valid "lib*.so" from $my_toolset_root/lib/
    if [ -d "$my_toolset_root/lib/" ]; then
        p=$(strip_path "$my_toolset_root/lib/")
        export LD_LIBRARY_PATH="$p:$LD_LIBRARY_PATH"
    fi
    if [ -d "$my_toolset_root/lib/pkgconfig" ]; then
        p=$(strip_path "$my_toolset_root/lib/pkgconfig/")
        export PKG_CONFIG_PATH="$p:$PKG_CONFIG_PATH"
    fi

    # TODO: Python lib path
    if [ -d "$my_toolset_root/lib/python2.7/site-packages/" ]; then 
        p=$(strip_path "$my_toolset_root/lib/python2.7/site-packages/")
        export PYTHONPATH="$p:$PYTHONPATH"
    elif [ -d "$my_toolset_root/lib/python2.6/site-packages/" ]; then
        p=$(strip_path "$my_toolset_root/lib/python2.6/site-packages/")
        export PYTHONPATH="$p:$PYTHONPATH"
    fi
}

function del_path() {
    local mypath=$1
    # iterate over rest of arguments
    for i in $@[2,-1];
    do
        path_to_remove=$(strip_path $i)
        mypath=$(echo $mypath | tr -s ":" "\n" | grep -vwE "$path_to_remove" | tr -s "\n" ":" | sed "s/:$//")
    done
    echo $mypath
}

function test_path() {
    echo $1
}

function del_my_tools() {
    local my_toolset_root=$1

    export PATH=$(del_path $PATH "$my_toolset_root/bin" "$my_toolset_root/sbin")
    export MANPATH=$(del_path $MANPATH "$my_toolset_root/share/man")
    export INFOPATH=$(del_path $INFOPATH "$my_toolset_root/share/info")
    
    export LD_LIBRARY_PATH=$(del_path $LD_LIBRARY_PATH "$my_toolset_root/lib/")
    export PKG_CONFIG_PATH=$(del_path $PKG_CONFIG_PATH "$my_toolset_root/lib/pkgconfig/")
    # TODO: Python lib path
    export PYTHONPATH=$(del_path $PYTHONPATH "$my_toolset_root/lib/python2.7/site-packages/" "$my_toolset_root/lib/python2.6/site-packages/")
    return
}

## END OF FILE #################################################################
# vim:filetype=zsh foldmethod=marker autoindent expandtab shiftwidth=4
# Local variables:
# mode: sh
# End:
