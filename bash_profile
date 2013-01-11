export PATH="./bin:/usr/local/bin:$PATH"
[[ -s "/Users/david/.rvm/scripts/rvm" ]] && source "/Users/david/.rvm/scripts/rvm"
alias subl='open -a "Sublime Text 2"'
alias serve="ruby -rwebrick -e\"s = WEBrick::HTTPServer.new(:Port => 3000, :DocumentRoot => Dir.pwd); trap('INT') { s.shutdown }; s.start\""
alias fore="foreman start -f Procfile-dev"
alias timesheet="git log --oneline --author=David --since='6am'"
alias logs="tail -f log/development.log"
alias console="bundle exec rails console"
alias migrate="bundle exec rake db:migrate"
alias reset="bundle exec rake:reset"
alias restart="touch tmp/restart.txt"
alias reload='. ~/.bash_profile'
alias myip="curl icanhazip.com"

function fixthis() {
  DIR="$( basename "$( pwd )" )"
  if [ $DIR == "Illume" ]; then
    cd ~/Projects/Illume
    bundle
    touch tmp/restart.txt
    rake db:migrate
    rake sunspot:reindex
  elif [ $DIR == "sliqr" ]; then
    cd ~/Projects/sliqr
    bundle
    touch tmp/restart.txt
    rake db:migrate
  fi
}
green='\e[0;32m'
endColor='\e[0m'
red='\e[0;31m'
blue='\e[1;34m'
brown='\e[0;33m'
lightBrown='\e[1;33m'
cyan='\e[0;36m'
PS1="${cyan}\u:\w${endColor}\$(git branch 2>/dev/null | grep -e '\* ' | sed 's/^..\(.*\)/${white}❮${endColor}${white}\1${endColor}${white}❯${endColor}/')⚡ "