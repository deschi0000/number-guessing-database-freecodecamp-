#!/bin/bash
# USERNAME_RESULT=$($PSQL "")
# Connect to the DB
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

# Welome Message
echo -e "\n~~~~~ NUMBER GUESSING GAME ~~~~~\n"

# Prompt for username
echo -e "Enter your username:"
read USERNAME

# See if the user exists
USERNAME_RESULT=$($PSQL "SELECT * FROM users WHERE username = '$USERNAME'")

# If they don't, insert them into the db and print msg
if [[ -z $USERNAME_RESULT ]]
  then 
    INSERT_USER_RESULT=$($PSQL "INSERT INTO users (username)
                                  VALUES ('$USERNAME')")
    echo -e "Welcome, $USERNAME! It looks like this is your first time here."

else
  # Get number of games played
  NUM_GAMES_PLAYED=$($PSQL "SELECT COUNT(games_id) FROM games 
                              JOIN users USING (user_id)
                              WHERE username = '$USERNAME'" )

  # Get game with the fewest guess
  FEWEST_GUESS_GAME=$($PSQL "SELECT MIN(number_of_guesses) FROM games
                              JOIN users USING (user_id)
                              WHERE username = '$USERNAME'")
  
  # For neater printing in the echo
  if [[ -z $FEWEST_GUESS_GAME ]]
    then
    FEWEST_GUESS_GAME=0
  fi

  # Else they exist and print back the stats
  echo -e "Welcome back, $USERNAME! You have played $NUM_GAMES_PLAYED games, and your best game took $FEWEST_GUESS_GAME guesses."
fi


START_GAME () {
  echo -e "Guess the secret number between 1 and 1000:"
  # Choose a random num between 1 - 1000
  RANDOM_NUM=$((1 + $RANDOM % 1000))
  echo $RANDOM_NUM

  # Get user input and make sure it is an int
  read USER_GUESS
  if [[ ! $USER_GUESS =~ ^[0-9]+$ ]]
    then 
      while [[ ! $USER_GUESS =~ ^[0-9]+$ ]]
        do
          echo That is not an integer, guess again:
          read USER_GUESS
        done
  fi
  echo "your guess: $USER_GUESS"

  # while [[ $USER_GUESS -ne RANDOM_NUM ]]

}

START_GAME


