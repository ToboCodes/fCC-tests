#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.
echo $($PSQL "TRUNCATE TABLE games, teams;")
cat games.csv | while IFS="," read YR RO WIN LOSE W_GOAL L_GOAL
do
  if [[ $YR != "year" ]]
  then
    # get winner_id
    WIN_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WIN'")
    # if not found
    if [[ -z $WIN_ID ]]
    then
      # insert team
      echo $($PSQL "INSERT INTO teams(name) VALUES('$WIN')")
      # get new winner_id
      WIN_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WIN'")
    fi
    # get loser_id
    LOSE_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$LOSE'")
    # if not found
    if [[ -z $LOSE_ID ]]
    then
      # insert team
      echo $($PSQL "INSERT INTO teams(name) VALUES('$LOSE')")
      # get new winner_id
      LOSE_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$LOSE'")
    fi
    echo $($PSQL "INSERT INTO games(year, winner_id, opponent_id, winner_goals, opponent_goals, round) VALUES($YR, $WIN_ID, $LOSE_ID, $W_GOAL, $L_GOAL, '$RO')")
  fi
done
