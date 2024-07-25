# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Use powerline
USE_POWERLINE="true"
# Has weird character width
# Example:
#    is not a diamond
HAS_WIDECHARS="false"
# Source manjaro-zsh-configuration
if [[ -e /usr/share/zsh/manjaro-zsh-config ]]; then
  source /usr/share/zsh/manjaro-zsh-config
fi
# Use manjaro zsh prompt
if [[ -e /usr/share/zsh/manjaro-zsh-prompt ]]; then
  source /usr/share/zsh/manjaro-zsh-prompt
fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# bun completions
[ -s "/home/skeggang/.bun/_bun" ] && source "/home/skeggang/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# pnpm
export PNPM_HOME="/home/skeggang/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

# zoxide
eval "$(zoxide init --cmd cd zsh)"

# hell of an alias
alias astcla="cd"

# fzf 
# eval "$(fzf --zsh)" -> this trigger an error

# tailwind memory allocation
NODE_OPTIONS="--max-old-space-size=8192"

#---#---/CUSTOM ALIASES/---#---#

alias ls="exa"
alias yolo="$HOME/git/ecpgpp/getDevEnv/scripts/yoloUpdateV2.sh"
alias meteo='curl wttr.in/\?format="%l:+%t+%c+%S+%m+%s\n"'
alias pomodoro="$HOME/git/bash-hazard/timer.sh -m 40 && ./git/bash-hazard/timer.sh -m 10"
# sounds #
alias wow="paplay $HOME/Music/sounds/soundeffect_wow_fairy_tales.mp3"
alias quack="paplay $HOME/Music/sounds/soundeffect_duck_quacks_and_disappears.mp3"

# symfony alias #
alias sy="php bin/console"

# kb layout
alias frus="$HOME/git/ecpgpp/getDevEnv/scripts/kb-layout-us-ansi.sh"


#################### OTHER #######################
# MyAtlas config requirements
# alias cd-lime='cd /var/www/myatlas'
alias cd-lime='cd ~/git/reverse814-business/myatlas'
# alias lime='php /var/www/myatlas/lime/lime.php'
alias lime='php ~/git/reverse814-business/myatlas/lime/lime.php'

################### ANDROID DEV ##################
export ANDROID_HOME=$HOME/Android/Sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/platform-tools
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export JAVA_HOME=/user/lib/jvm/java-11-openjdk
export PATH=$JAVA_HOME/bin:$PATH
