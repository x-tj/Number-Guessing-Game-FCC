#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

echo "Enter your username:"
read USERNAME

# Fetch user_id and games played from DB
USER_INFO=$($PSQL "SELECT user_id, frequent_games FROM users WHERE username='$USERNAME';")

if [[ -z $USER_INFO ]]; then
  # New user case
  $PSQL "INSERT INTO users(username, frequent_games) VALUES('$USERNAME', 0);" > /dev/null
  USER_ID=$($PSQL "SELECT user_id FROM users WHERE username='$USERNAME';")
  echo -e "\nWelcome, $USERNAME! It looks like this is your first time here."
else
  # Existing user
  USER_ID=$(echo "$USER_INFO" | cut -d '|' -f 1 | xargs)
  GAMES_PLAYED=$(echo "$USER_INFO" | cut -d '|' -f 2 | xargs)

  # Fetch best game (minimum number of guesses)
  BEST_GAME=$($PSQL "SELECT MIN(best_guess) FROM games WHERE user_id=$USER_ID;" | xargs)

  echo -e "\nWelcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
fi


# Secret number
SECRET_NUMBER=$(( RANDOM % 1000 + 1 ))
GUESS_COUNT=0
echo "Guess the secret number between 1 and 1000:"

while true; do
  read GUESS

  # Check integer
  if ! [[ $GUESS =~ ^[0-9]+$ ]]; then
    echo "That is not an integer, guess again:"
    continue
  fi

  (( GUESS_COUNT++ ))

  if [[ $GUESS -lt $SECRET_NUMBER ]]; then
    echo "It's higher than that, guess again:"
  elif [[ $GUESS -gt $SECRET_NUMBER ]]; then
    echo "It's lower than that, guess again:"
  else
    echo "You guessed it in $GUESS_COUNT tries. The secret number was $SECRET_NUMBER. Nice job!"
    # Update game
    $PSQL "INSERT INTO games(user_id, best_guess) VALUES($USER_ID, $GUESS_COUNT);" > /dev/null
    $PSQL "UPDATE users SET frequent_games = frequent_games + 1 WHERE user_id=$USER_ID;" > /dev/null
    break
  fi
done
