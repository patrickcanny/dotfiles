function roll(){
  if [ "$#" -ne 2 ]; then
    echo "USAGE: roll <NUMBER OF DICE TO ROLL> d<NUMBER OF SIDES>"
  else
    echo "Rolling $1 $2..."
    NUMBER=$(echo "$2"|sed 's/[^0-9]*//g')
    N=$(((RANDOM % $NUMBER) + 1))
    echo $(($N * $1))
  fi
}
function roll(){
  if [ "$#" -ne 2 ]; then
    echo "USAGE: roll <NUMBER OF DICE TO ROLL> d<NUMBER OF SIDES>"
  else
    echo "Rolling $1 $2..."
    NUMBER=$(echo "$2"|sed 's/[^0-9]*//g')
    N=$(((RANDOM % $NUMBER) + 1))
    echo $(($N * $1))
  fi
}
