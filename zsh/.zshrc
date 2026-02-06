export ZSH="$HOME/.oh-my-zsh"

## Terminal theme
ZSH_THEME="fwalch"
typeset -gA ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_STYLES[command]='fg=default'
source ~/powerlevel10k/powerlevel10k.zsh-theme
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# oh-my-zsh plugins
plugins=(git zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

## Aliases
alias vi="nvim"
alias vim="nvim"
alias cat="bat"
alias top="btop"
alias htop="btop"
alias mail="aerc"
alias torrent="superseedr"
alias torrentsearch="magnetfinder"

# Env vars
export EDITOR=nvim
export NVM_DIR="$(brew --prefix nvm)"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
export PATH=$PATH:$HOME/go/bin
export PATH=$PATH:$HOME/.platformio/penv/bin
export PATH=$PATH:$HOME/.local/bin

eval "$(zoxide init --cmd cd zsh)"
eval "$(fzf --zsh)"

## Vim mode
bindkey -v
function vi-yank-clipboard {
  zle vi-yank                   # perform the normal yank
  print -rn -- "$CUTBUFFER" | pbcopy   # copy last yank to macOS clipboard
}
zle -N vi-yank-clipboard
bindkey -M vicmd "y" vi-yank-clipboard
function vi-visual-yank-clipboard {
  zle vi-yank
  print -rn -- "$CUTBUFFER" | pbcopy
}
zle -N vi-visual-yank-clipboard
bindkey -M visual "y" vi-visual-yank-clipboard

zstyle ':completion:*' menu select

# tmux command to resume session or create one if it doesn't exist
tmux() {
  if command -v tmux >/dev/null 2>&1; then
    if [ -z "$TMUX" ]; then
      command tmux attach || command tmux new
    else
      command tmux "$@"
    fi
  fi
}

## Fzf settings
export FZF_CTRL_T_OPTS="--preview '$show_file_or_dir_preview'"

## Yazi
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	IFS= read -r -d '' cwd < "$tmp"
	[ -n "$cwd" ] && [ "$cwd" != "$PWD" ] && builtin cd -- "$cwd"
	rm -f -- "$tmp"
}
_fzf_comprun() {
  local command=$1
  shift

  case "$command" in
    cd) fzf --preview 'ls -la {} | head -200' "$@" ;;
    export|unset) fzf --preview "eval 'echo ${}'"         "$@" ;;
    ssh)          fzf --preview 'dig {}'                   "$@" ;;
    *)            fzf --preview "$show_file_or_dir_preview" "$@" ;;
  esac
}

