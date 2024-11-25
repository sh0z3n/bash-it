# Dracula zsh-syntax-highlighting configuration
#source $HOME/.zsh/dracula-zsh-syntax-highlighting/dracula-zsh-syntax-highlighting.zsh

# Load zsh-syntax-highlighting
source $HOME/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh


# Typewritten prompt with Dracula color mappings
ZSH_THEME="typewritten"

export DRACULA_TYPEWRITTEN_COLOR_MAPPINGS="primary:#d5ccff;secondary:#9580ff;info_neutral_1:#d0ffcc;info_neutral_2:#ffffcc;info_special:#ff9580;info_negative:#ff5555;notice:#ffff80;accent:#d5ccff"
export TYPEWRITTEN_COLOR_MAPPINGS="${DRACULA_TYPEWRITTEN_COLOR_MAPPINGS}"
export TYPEWRITTEN_PROMPT_LAYOUT="half_pure"


set_prompt() {

    if [[ $EUID == 0 ]]; then
        PROMPT=$'╭─%B%F{red}💀 ROOT @ %F{cyan}%~%f %F{yellow}%f\n'
        PROMPT+=$'╰─%F{red}➜%f '
else
    PROMPT=$'╭─%B%F{green}%n%f%b%F{yellow} [%~]%f '  #
    PROMPT+=$'%F{blue}%f \n'
    PROMPT+=$'╰─%F{magenta}��%f '
fi

}
export thm=10.10.10.10
alias rick='curl http://ascii.live/rick'
set_prompt
# For command colors
autoload -U colors && colors
ZLE_RPROMPT_INDENT=0

# this one is for the
# Color for script files
ZSH_HIGHLIGHT_STYLES[path]='fg=cyan'
ZSH_HIGHLIGHT_STYLES[path-quoted]='fg=cyan'
# Color for image files
ZSH_HIGHLIGHT_STYLES[globbing]='fg=magenta'
# Source syntax highlighting (make sure it's

# Update prompt before each command
precmd() {
    set_prompt
}
# Better history settings
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
# Enable command completion
autoload -Uz compinit
compinit
ZSH_HIGHLIGHT_STYLES[command]='fg=%F{blue},bold'
# Add color to ls and other commands
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias ip='ip -color=auto'
alias l='ls'
alias burp='burpsuite'
alias ..='cd ../'
alias ../='cd ../'
zle_highlight=(default:bold,fg=white)

root() {
    # Save current terminal color settings
    local RESET="\033[0m"
    local BG_RED="\033[41m"
    local FG_WHITE="\033[97m"

    # Change terminal background color
    echo -e "${BG_RED}${FG_WHITE}Root session activated. Type 'exit' to return.${RESET}"

    # Start a root shell
    sudo su

    # Reset terminal color after exiting root
    echo -e "${RESET}Back to normal user session."
}
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
plugins=(git zsh-autosuggestions)
# Set suggestion text color to cyan
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=cyan'
