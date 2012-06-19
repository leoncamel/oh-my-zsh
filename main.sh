
if [ "$TERM" = "dumb" ]
then
    unsetopt zle
    unsetopt prompt_cr
    unsetopt prompt_subst
    # unfunction precmd # these two are not
    # unfunction preexec # working for me
    PS1='$ '
else
    source "$HOME/.oh-my-zsh/leon-zshrc.sh"
    # source "$HOME/.oh-my-zsh/simple-zshrc.sh"
fi
