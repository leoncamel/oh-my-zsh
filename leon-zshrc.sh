# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
# ZSH_THEME="robbyrussell"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)

#
# Customize load plugins and host-specific config based on `hostname`
#

my_host_name="$(hostname)"
case "$(hostname)" in
    "Leon-no-MBP")
        # export ZSH_THEME="robbyrussell"
        export ZSH_THEME="xiong-chiamiov-plus"
        plugins=(osx macports svn rvm git github autojump brew pip switch-net-env splayerx ghc)
        echo "Load Plugins for $my_host_name"
        echo "  Plugins: $plugins"
        ;;
    "leon-new-desktop")
        export ZSH_THEME="bira"
        plugins=(svn rvm github pip switch-net-env dev-env ghc)
        echo "Load Plugins for $my_host_name"
        echo "  Plugins: $plugins"
        ;;
    "slsi177")
        export ZSH_THEME="afowler"
        plugins=(svn rvm github switch-net-env dev-env)
        echo "Load Plugins for $my_host_name"
        echo "  Plugins: $plugins"
        ;;
    *)
        plugins=(git)
        echo "Load default plugins for Unknow-host"
        echo "  Plugins: $plugins"
        ;;
esac

# host-specific configs : add PATH and other environment variables
source $ZSH/lib/add_my_tools.zsh
if [ -f "$ZSH/host-configs/$my_host_name-zshrc.sh" ]; then
    source "$ZSH/host-configs/$my_host_name-zshrc.sh"
fi

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
