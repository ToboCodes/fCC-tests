#!/bin/bash
PSQL="psql -X --username=freecodecamp --dbname=number_guess --tuples-only --no-align -c"
NUMBER=$((1 + $RANDOM % 1000))
GUESSES=1

NUMBER_GAME(){
  read GUESS
  if [[ $NUMBER == $GUESS ]]
  then
    echo "You guessed it in $GUESSES tries. The secret number was $NUMBER. Nice job!"
    INSERT_RESULT=$($PSQL "UPDATE users SET games_played=$(($PLAYED + 1)) WHERE user_id=$USER_ID")
    if [[ ! $BEST =~ ^[0-9]+$ ]] || [[ $GUESSES < $BEST ]]
    then
      INSERT_RESULT=$($PSQL "UPDATE users SET best_game=$GUESSES WHERE user_id=$USER_ID")
    fi
  elif [[ ! $GUESS =~ ^[0-9]+$ ]]
  then
    echo "That is not an integer, guess again:"
    NUMBER_GAME
  elif [[ $NUMBER < $GUESS ]]
  then
    ((GUESSES+=1))
    echo "It's lower than that, guess again:"
    NUMBER_GAME
  else
    ((GUESSES+=1))
    echo "It's higher than that, guess again:"
    NUMBER_GAME
  fi
}

echo "Enter your username:"
read USERNAME
USER_ID=$($PSQL "SELECT user_id FROM users WHERE username='$USERNAME'")
if [[ -z $USER_ID ]]
then
  # Insert user to DB
  INSERT_RESULT=$($PSQL "INSERT INTO users(username) VALUES('$USERNAME')")
  echo "Welcome, $USERNAME! It looks like this is your first time here."
  # Get new user ID
  USER_ID=$($PSQL "SELECT user_id FROM users WHERE username='$USERNAME'")
  PLAYED=0
  BEST=NULL
  echo "Guess the secret number between 1 and 1000:"
  NUMBER_GAME
else
  # Get games played and best
  PLAYED=$($PSQL "SELECT games_played FROM users WHERE user_id=$USER_ID")
  BEST=$($PSQL "SELECT best_game FROM users WHERE user_id=$USER_ID")
  # Print summary
  echo "Welcome back, $USERNAME! You have played $PLAYED games, and your best game took $BEST guesses."
  echo "Guess the secret number between 1 and 1000:"
  NUMBER_GAME
fi