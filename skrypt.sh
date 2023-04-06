X=100

function display_help {
  echo "Uzycie: skrypt.sh [OPTION]"
  echo "Opcje:"
  echo "  -d, --date         wyswietli dzisiejsza date"
  echo "  -h, --help         wyswietlenie wszystkich dostepnych opcji"
  echo "  -l, --logs [X]   utworzy automatycznie X plikow logX.txt Automatycznie 100"
  echo "  -e, --errors [X] utworzy automatycznie X plikow errorX.txt Automatycznie 100"
  echo "      --init         klonuje całe repozytorium do katalogu w którym został uruchomiony oraz ustawia ścieżkę w zmiennej środowiskowej PATH"
  echo "Przyklady:"
  echo "  skrypt.sh -d"
  echo "  skrypt.sh -l"
  echo "  skrypt.sh -l 30"
  echo "  skrypt.sh --errors"
  echo "  skrypt.sh -e 30"
  #sleep 5s
}

function logs {
  if [ -z "$1" ]; 
  then
    END=$X
  else
    END=$1
  fi

  for i in $(seq 1 $END)
  do
    touch log$i.txt
    echo log$i.txt>log$i.txt
    echo "skrypt.sh">>log$i.txt
    DATE=$(date +"%m_%d_%Y")
    echo ${DATE}>>log$i.txt
  done
}

function errors_logs {
  if [ -z "$1" ]; then
    END=$X
  else
    END=$1
  fi

  for i in $(seq 1 $END)
  do
    touch error$i.txt
    echo error$i.txt>error$i.txt
    echo "skrypt.sh">>error$i.txt
    DATE=$(date +"%m_%d_%Y")
    echo ${DATE}>>error$i.txt
  done
}

while [[ $# -gt 0 ]]
do
  arg="$1"
  
  case $arg in
    -d|--date)
      date
	#sleep 5s
      exit 0
	;;
    -h|--help)
      display_help
      exit 0
      ;;
    -l|--logs)
      logs "$2"
      exit 0
      ;;
    -e|--errors)
      errors_logs "$2"
      exit 0
      ;;
    --init)
      #git clone <remote_repo_url> && export PATH=$PATH:$(pwd)/<local_repo_name>
      exit 0
      ;;
    *)
      echo "Unknown option: $arg"
      display_help
      exit 1
      ;;
  esac

  shift
done

display_help
exit 0