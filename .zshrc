# Use powerline
USE_POWERLINE="true"
# Source manjaro-zsh-configuration
#source ~/.zsh-nvm/zsh-nvm.plugin.zsh

#if [[ -e /usr/share/zsh/manjaro-zsh-config ]]; then
source /usr/share/zsh/manjaro-zsh-config
#fi
# Use manjaro zsh prompt
#if [[ -e /usr/share/zsh/manjaro-zsh-prompt ]]; then
#  source /usr/share/zsh/manjaro-zsh-prompt
#fi

# pure prompt
fpath+=$HOME/.zsh/pure
autoload -U promptinit; promptinit
prompt pure




alias ls='ls --color=always'
alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias chrome="google-chrome-stable --force-device-scale-factor=0.8 &"
alias cat="bat --paging=never"
#alias qutebrowser='python3 ~/.local/share/qutebrowser-2.0.2/qutebrowser.py &'

#PKG_CONFIG_PATH=$PKG_CONFIG_PATH:/usr/lib/pkgconfig
#export PKG_CONFIG_PATH
#[ -f /opt/miniconda3/etc/profile.d/conda.sh ] && source /opt/miniconda3/etc/profile.d/conda.sh
