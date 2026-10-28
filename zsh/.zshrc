## History
export HISTTIMEFORMAT="%Y-%m-%d %T "  # Add timestamps to history
export HISTSIZE=100000  # big history (history default tops out ~600 commands)
export HISTFILESIZE=100000  # big history (history default tops out ~600 commands)
export PROMPT_COMMAND="history -a"

## Jupyter Notebook
export IP_ADDR=$(ifconfig eth0 2>/dev/null | grep "inet " | tr -s ' ' | cut -d ' ' -f 3)
alias notebook="jupyter notebook --no-browser --port 8080 --NotebookApp.token= --allow-root --ip=$IP_ADDR"

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="dracula"
# ZSH_THEME="powerlevel10k/powerlevel10k"

zstyle ':omz:update' mode auto      # update automatically without asking

plugins=(
	git
	zsh-autosuggestions
	zsh-syntax-highlighting
)

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

source $ZSH/oh-my-zsh.sh
command -v mise &> /dev/null && eval "$(mise activate zsh)"
