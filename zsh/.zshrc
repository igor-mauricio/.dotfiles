export ZSH="$HOME/.oh-my-zsh"

## Terminal theme
ZSH_THEME="fwalch"
typeset -gA ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_STYLES[command]='fg=default'
source ~/powerlevel10k/powerlevel10k.zsh-theme
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# oh-my-zsh plugins
plugins=(git zsh-autosuggestions zsh-syntax-highlighting)

# eza settings
show_file_or_dir_preview="if [ -d {} ]; then eza --tree --color=always {} | head -200; else bat -n --color=always --line-range :500 {}; fi"

## Fzf settings
export FZF_CTRL_T_OPTS="--preview '$show_file_or_dir_preview'"
export FZF_ALT_C_OPTS="--preview 'eza --tree --color=always {} | head -200'"
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
    cd)           fzf --preview 'eza --tree --color=always {} | head -200' "$@" ;;
    export|unset) fzf --preview "eval 'echo ${}'"         "$@" ;;
    ssh)          fzf --preview 'dig {}'                   "$@" ;;
    *)            fzf --preview "$show_file_or_dir_preview" "$@" ;;
  esac
}
source $ZSH/oh-my-zsh.sh

## Aliases
# alias ls="eza --color=always --long --git --no-filesize --icons=always --no-time --no-user --no-permissions"
alias vi="nvim"
alias vim="nvim"
alias ai="cd ~/Desktop;gemini"
alias cat="bat"
alias top="btop"
alias htop="btop"
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias mail="aerc"

# Env vars
export NVM_DIR="$(brew --prefix nvm)"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

# Path
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
