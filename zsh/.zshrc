# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Nav
bindkey -v

# Colors/Theme
export TERM="xterm-256color"

# Load Zsh tools for syntax highlighting and autosuggestions
HOMEBREW_FOLDER="/usr/local/share"
source "$HOMEBREW_FOLDER/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
source "$HOMEBREW_FOLDER/zsh-autosuggestions/zsh-autosuggestions.zsh"
USER=cannyp

# nvm stuff
export NVM_DIR=~/.nvm
source $(brew --prefix nvm)/nvm.sh

# alias'
alias vimrc='vi ~/.vimrc'
alias :q='exit'
alias ..='cd ..'
alias ..2='cd ../../'
alias ..3='cd ../../../'
alias FLX='python3 manage.py runserver 8080'
alias fv='npm run watch'
alias back='cd -'
alias bashrc='vi ~/.zshrc'
alias reload='source ~/dotfiles/zsh/.zshrc'
alias be='bundle exec'
alias bers='bundle exec rake spec'
alias bess='bundle exec spec spec'
alias bigrake='rake db:drop && rake db:create && rake db:migrate && rake db:schema:dump && rake db:test:prepare'
alias bp='vi ~/.bash_profile'
alias cd..='cd ..'
alias chrome='open -a /Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome'
alias cll='clear; ls -lAh'
alias coffeed='coffee --nodejs --debug'
alias coffeedefault='coffee -lo javascripts/ -w coffeescripts/ &'
alias cookiecutterDS='cookiecutter https://github.com/drivendata/cookiecutter-data-science'
alias cp='cp -i'
alias cwd='pwd | tr -d "\r\n" | pbcopy'
alias cycle2='ssh p544c349@cycle2.eecs.ku.edu'
alias gemdoc='gem environment gemdir/doc'
alias gemlist='gem list | grep -v "^( |$)"'
alias gemuninstallall='gem list | cut -d" " -f1 | xargs gem uninstall -aIx'
alias grep='grep -H -n'
alias h='history'
alias home='cd ~; clear; ls -lAh'
alias idle27='python -m idlelib.idle'
alias l='ls -CF'
alias la='ls -la'
alias ll='pwd && ls -l'
alias loco='lcm server'
alias lp='ls -p'
alias ls='ls -hp'
alias mongod='mongod --dbpath ~/data/db'
alias mv='mv -i'
alias nlink='npm link'
alias nodels='npm ls'
alias o='open'
alias dcu='docker-compose up'
alias lacrc='vi ~/lacunarc'

# Roll
roll () 
{ 
    if [ "$#" -ne 2 ]; then
        echo "USAGE: roll <NUMBER OF DICE TO ROLL> d<NUMBER OF SIDES>";
    else
        echo "Rolling $1 $2...";
        NUMBER=$(echo "$2"|sed 's/[^0-9]*//g');
        N=$(((RANDOM % $NUMBER) + 1));
        echo $(($N * $1));
    fi
}

# Requires powerlevel10k directory in root, should move to dotfiles
source ~/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
autoload -Uz compinit && compinit

# Path
export PATH=$PATH:$(go env GOPATH)/bin
export PATH=/Users/cannyp/Library/Python/2.7/bin:$PATH

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# requires fuck
eval $(thefuck --alias)
