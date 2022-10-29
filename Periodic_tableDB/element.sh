PSQL="psql -X --username=freecodecamp --dbname=periodic_table --tuples-only -c"

ELEMENT_PROCESS(){
  if [[ -z $ATOMIC_NUM ]]
  then
    echo "I could not find that element in the database."
  else
    # get element symbol and name 
    DETAILS=$($PSQL "SELECT * FROM elements FULL JOIN properties USING(atomic_number) FULL JOIN types USING(type_id) WHERE atomic_number=$ATOMIC_NUM")
    echo $DETAILS | while read TYPE_ID BAR ATOMIC_NUM BAR SYMBOL BAR NAME BAR ATOMIC_MASS BAR MELT_POINT BAR BOIL_POINT BAR TYPE
    do
      echo "The element with atomic number $ATOMIC_NUM is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELT_POINT celsius and a boiling point of $BOIL_POINT celsius."
    done
  fi
}

if [[ -z $1 ]]
then
  echo "Please provide an element as an argument."
elif [[ $1 =~ ^[0-9]+$ ]]
then
  ATOMIC_NUM=$($PSQL "SELECT atomic_number FROM elements WHERE atomic_number=$1")
  ELEMENT_PROCESS
else
  ATOMIC_NUM=$($PSQL "SELECT atomic_number FROM elements WHERE symbol='$1' OR name='$1'")
  ELEMENT_PROCESS
fi