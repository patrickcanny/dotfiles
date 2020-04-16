export TERM="xterm-256color"
POWERLEVEL9K_MODE='nerdfont-complete'
source  ~/powerlevel9k/powerlevel9k.zsh-theme
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(ssh dir vcs newline status)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=()
POWERLEVEL9K_PROMPT_ADD_NEWLINE=true
alias ls='ls -G'
# Load Zsh tools for syntax highlighting and autosuggestions
HOMEBREW_FOLDER="/usr/local/share"
source "$HOMEBREW_FOLDER/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
source "$HOMEBREW_FOLDER/zsh-autosuggestions/zsh-autosuggestions.zsh"
USER=patrickcanny
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
alias vimrc='vi ~/.vimrc'
alias :q='exit'
alias ..='cd ..'
alias ..2='cd ../../'
alias ..3='cd ../../../'
alias FLX='python3 manage.py runserver 8080'
alias fv='npm run watch'
alias back='cd -'
alias bashrc='vi ~/.zshrc'
alias reload='source ~/.zshrc'
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
alias pip='pip3'
export ENVIRONMENT_NAME="localhost"
export ENVIRONMENT_NAME="localhost"
PATH="/usr/local/opt/make/libexec/gnubin:$PATH"
PATH="/usr/local/bin$PATH"
export PATH="/usr/local/opt/ruby/bin:$PATH"
tmux

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
