
switch-net-env() {
    emulate -L zsh # Necessary or not ?
    local usage
    usage='switch-net-env {home,waseda,mitmproxy}'

    case $1 in
        ("")
            printf '%s\n\n' 'ERROR: No search string specified. Aborting.'
            printf '%s\n\n\n' ${usage} && return 1
            ;;
        (waseda)
            export http_proxy="http://133.9.49.250:8080/"
            export https_proxy="http://133.9.49.250:8080/"
            export ftp_proxy="http://133.9.49.250:8080/"
            export no_proxy="localhost,127.0.0.0/8,*.local,192.168.0.0/16,133.9.42.0/24"
            export ANT_OPTS="-Dhttp.proxyHost=133.9.49.250 -Dhttp.proxyPort=8080"
            export RSYNC_PROXY="133.9.49.250:8080"
            export GIT_PROXY_COMMAND=git-proxy.sh
            ;;
        (mitmproxy)
            export http_proxy="http://127.0.0.1:8080/"
            export https_proxy="http://127.0.0.1:8080/"
            export ftp_proxy="http://127.0.0.1:8080/"
            export no_proxy="localhost,127.0.0.0/8,*.local,192.168.0.0/16,133.9.42.0/24"
            export ANT_OPTS="-Dhttp.proxyHost=127.0.0.1 -Dhttp.proxyPort=8080"
            export RSYNC_PROXY="127.0.0.1:8080"
            export GIT_PROXY_COMMAND=git-proxy.sh
            ;;
        (home)
            unset http_proxy
            unset https_proxy
            unset ftp_proxy
            unset no_proxy
            unset ANT_OPTS
            unset RSYNC_PROXY
            unset GIT_PROXY_COMMAND
            ;;
        (*)
            printf '%s\n\n' 'Invalid parameter'
            printf '%s\n\n\n' ${usage} && return 1
            ;;
    esac
}

mac-proxy-net-env() {
    emulate -L zsh  # TODO: Necessary or not?
    local usage
    usage='osx-net-env {eth,air} {on,off}'

    case `uname -s` in
        ("Darwin")
            printf "Your OS is : '%s'\nContinue ...\n" `uname -s`
            ;;
        (*)
            printf "Your OS is not Mac OSX. Can NOT use this function.\n" && return 1
            ;;
    esac

    local intf
    case $1 in
        ("")
            intf="Ethernet"
            ;;
        ("eth")
            intf="Ethernet"
            ;;
        ("air")
            intf="Wi-Fi"
            ;;
    esac

    case $2 in
        ("")
            printf '%s\n' 'Enable/Disable proxy(http,https,ftp) settings on Ethernet.'
            printf '%s\n' 'Usage:'
            printf '\t\t%s\n\n\n' ${usage} && return 1
            ;;
        (on)
            # networksetup -setftpproxy ${intf} 133.9.49.250 8080 on
            # networksetup -setwebproxy ${intf} 133.9.49.250 8080 on
            # networksetup -setsecurewebproxystate ${intf} 133.9.49.250 8080 on
            networksetup -setftpproxystate ${intf} on
            networksetup -setwebproxystate ${intf} on
            networksetup -setsecurewebproxystate ${intf} on
            printf 'networksetup : Enable proxy setting on %s\n\n' ${intf}
            ;;
        (off)
            # networksetup -setftpproxy ${intf} 133.9.49.250 8080 off
            # networksetup -setwebproxy ${intf} 133.9.49.250 8080 off
            # networksetup -setsecurewebproxystate ${intf} 133.9.49.250 8080 off
            networksetup -setftpproxystate ${intf} off
            networksetup -setwebproxystate ${intf} off
            networksetup -setsecurewebproxystate ${intf} off
            printf 'networksetup : Disable proxy setting on %s\n\n' ${intf}
    esac
}

#
# completion
#

function _mac-proxy-net-env {

    _arguments \
        '1:media:(eth air)' \
        '2:status:(on off)'

    return 1;
}

compdef 'compadd home waseda mitmproxy' switch-net-env
# compdef 'compadd on off' mac-proxy-net-env
compdef _mac-proxy-net-env mac-proxy-net-env


## END OF FILE #################################################################
# vim:filetype=zsh foldmethod=marker autoindent expandtab shiftwidth=4
# Local variables:
# mode: sh
# End:
