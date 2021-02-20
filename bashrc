# TODO Add unique characters to search and replace
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
export FZF_DEFAULT_COMMAND='rg --files --hidden --follow -i -g "!{.git,node_modules}/*"'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
bind -x '"\C-p": vim $(fzf);'
export BAT_THEME="gruvbox"
# TODO continued
