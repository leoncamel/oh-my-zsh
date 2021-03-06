
################################################################################
## utilities PATHs
################################################################################

#
# add "/usr/local/bin" to $PATH
#
export PATH=/usr/local/bin/:$PATH

export PATH=/usr/X11/bin:$PATH

#
# add my utilities from $HOME/bin
#
if [ -d "$HOME/bin/" ]; then
    export PATH=$HOME/bin/:$PATH
fi

# MacRuby : 
#    notes : 
#       [1] Built from "/Users/leoncamel/tmp/MacRuby/MacRuby-MacRuby-ed8b060"
#       [2] No "CFNetwork" wrapper. So, I comment this out.
# add_my_tools "/Library/Frameworks/MacRuby.framework/Versions/Current/usr"

# MacPorts root
# add_my_tools "/opt/local/"

# ghc-6.12.3
#add_my_tools "$HOME/bin/ghc-6.12.3/"
# Cabal
export PATH="$HOME/Library/Haskell/bin:$PATH"
#add_my_tools "$HOME/.cabal/"
alias hsenv="virthualenv"

# node.js git version
#add_my_tools "$HOME/bin/node-git/"

# Leon's Misc Utilities
# add_my_tools "$HOME/bin/proxytunnel-1.9.0/"
add_my_tools "$HOME/bin/cmucl-20b/"
add_my_tools "$HOME/bin/ccl-darwin-1.6/"

# plowshare supports:
# Megaupload, Rapidshare, 2Shared, 4Shared, ZShare, Badongo, Divshare.com,
# Depositfiles, Netload.in, Sendspace, Usershare, x7.to
# and some others file sharing services.
#
add_my_tools "$HOME/bin/plowshare-svn/"

# for Google's chromium
export PATH="$HOME/bin/depot_tools":$PATH

# Wireshark Commandline Utilities
export PATH="$HOME/bin/Wireshark_CMD/":$PATH

export PATH="$HOME/bin/GoogleAppEngine/":$PATH

# Allegro CL
export PATH="$HOME/bin/AllegroCL/":$PATH

# Racket-v5.2
add_my_tools "$HOME/bin/Racket-v5.2.1/"

# cmigemo
add_my_tools "$HOME/bin/cmigemo/"

# clojurescript
export CLOJURESCRIPT_HOME="$HOME/haskell/clojure/clojurescript.git/"
add_my_tools "$CLOJURESCRIPT_HOME"

# Macport's emacs : for "emacsclient"
#export PATH="/Applications/MacPorts/Emacs.app/Contents/MacOS/bin/":$PATH

# Erlang
# add_my_tools "$HOME/bin/erlang-r14b04-by-kerl/"

# CUDA SDK
#export PATH=/usr/local/cuda/bin:$PATH
#export DYLD_LIBRARY_PATH=/usr/local/cuda/lib:$DYLD_LIBRARY_PATH

# RVM
# [[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" # Load RVM function
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
# export PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

# NVM : node version manager
[[ -s "$HOME/.nvm/nvm.sh" ]] && . "$HOME/.nvm/nvm.sh" # Load NVM function

##########
# homebrew
#alias emacs-app="open -a /Users/leoncamel/bin/homebrew/Cellar/emacs/HEAD/Emacs.app"
export HOMEBREW_EDITOR="emacsclient -n"
export HOMEBREW_KEEP_INFO=1
export HOMEBREW_VERBOSE=1
export HOMEBREW_MAKE_JOBS=1

add_my_tools $HOME/bin/homebrew/
alias t='todo.sh'

# coreutils from homebrew
# alias df='gdf -a'
# alias rm='grm -i'
# alias cp='gcp'
# alias readlink='greadlink'
# alias du='gdu'
# alias sed='gsed'
export PATH="$(brew --prefix coreutils)/libexec/gnubin:$PATH"
alias rm='rm -i'
alias df='df -a'

#######################
# python from homebrew
#######################
# Python 3.x series
# export PYTHONPATH=$PYTHONPATH:"$HOME/bin/homebrew/lib/python3.2/site-packages"
# export PATH="$HOME/bin/homebrew/share/python3:$PATH"
# Python 2.7 series (major use)
export PYTHONPATH=$PYTHONPATH:"$HOME/bin/shogun-git/lib/python2.7/dist-packages/"
export PATH="$HOME/bin/homebrew/share/python:$PATH"

# ruby from homebrew
# export PATH="$HOME/bin/homebrew/Cellar/ruby/1.9.3-p194/bin:$PATH"

# autoenv from homebrew
# source "/Users/leoncamel/bin/homebrew/Cellar/autoenv/0.1.0/activate.sh"

# ocamlbrew
export OCAMLBREW_BASE="$HOME/opt/ocamlbrew"
export OCAML_BASE="$HOME/opt/ocamlbrew/ocaml-4.00.1"
export ODB_BUILD_DIR="$HOME/opt/ocamlbrew/ocaml-4.00.1/build/odb"
# export OCAML_MAJOR_VERSION=4
# export OCAML_MINOR_VERSION=00
# export OCAML_PATCH_VERSION=0
add_my_tools "$HOME/opt/ocamlbrew/ocaml-4.00.1/"

#
# Texlive 2011
#
# TODO: pstopdf can not work?
export PATH="/usr/local/texlive/2011/bin/x86_64-darwin/:$PATH"

# ida advanced pro 5.2
export PATH="/opt/idaadv/:$PATH"

# intel icc
export INTEL_LICENSE_FILE=/opt/intel/EVAL_A_CMP_CPP_VTKR-XHHZ6RGT.lic

################################################################################
## alias
################################################################################

# TODO : for my MacBook Pro
# coreutils alias
#alias find='gfind'
alias pyv-activate='source ~/pyvirt/bin/activate'
alias rsync='rsync --progress'

# emacs & emacsclient
# reference : http://qiita.com/items/609681b9635e5563d4a9
alias ec='emacsclient -n'
function ec-readonly() {
    emacsclient -e "(find-file-read-only \"$1\")"
}

# Mac OSX's alias
alias chrome_proxy='open -a /Applications/Internet/Google\ Chrome.app --args --proxy-server=133.9.49.250:8080 --proxy-bypass-list=localhost,127.0.0.0/8,*.local,192.168.0.0/16,13'
alias chrome_timel='open -a /Applications/Internet/Google\ Chrome.app --args --enable-extension-timeline-api'

#alias mplayerx='open -a /Applications/MPlayerX.app'
#alias splayerx='open -a /Applications/SPlayerX.app'

# SourceGraph : A haskell program analyzer
#               http://hackage.haskell.org/package/SourceGraph
alias sg='SourceGraph'

# TODO : fix this for my MacBook Pro
# these option are dumped from ubuntu
# if [[ -x "$(which gls)" ]]
# then
#     alias ls='gls --color=auto'
# fi
