#!/bin/bash

# Connect to the DB
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

# Welome Message
  echo -e "\n~~~~~ Number Guessing Game ~~~~~\n" 

# Prompt for username
echo "Enter your username: "
read USERNAME


# See if the user exists
USER_ID=$($PSQL "SELECT user_id FROM users WHERE username = '$USERNAME'")

# If they don't, insert them into the db and print msg
if [[ -z $USER_ID ]];
  then 
    echo -e "Welcome, $USERNAME! It looks like this is your first time here."
    
    INSERT_USER_RESULT=$($PSQL "INSERT INTO users (username)
                                  VALUES ('$USERNAME')")

    USER_ID=$($PSQL "SELECT user_id FROM users WHERE username = '$USERNAME'")

else
  # Get number of games played
  NUM_GAMES_PLAYED=$($PSQL "SELECT COUNT(*) FROM games 
                              WHERE user_id = $USER_ID" )

  # Get game with the fewest guess
  FEWEST_GUESS_GAME=$($PSQL "SELECT MIN(number_of_guesses) FROM games
                              WHERE user_id = $USER_ID")
  
  # # For neater printing in the echo
  if [[ -z $FEWEST_GUESS_GAME ]]
    then
    FEWEST_GUESS_GAME=0
  fi

  # Else they exist and print back the stats
  echo -e "\nWelcome back, $USERNAME! You have played $NUM_GAMES_PLAYED games, and your best game took $FEWEST_GUESS_GAME guesses."
fi


START_GAME () {
  echo -e "Guess the secret number between 1 and 1000:"
  # Choose a random num between 1 - 1000
  RANDOM_NUM=$((1 + $RANDOM % 1000))
  # Debugging
  # echo $RANDOM_NUM

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
  # echo "your guess: $USER_GUESS"

  NUMBER_OF_GUESSES=1

  # Keep getting input from the user until they guess correctly
  while [[ $USER_GUESS -ne $RANDOM_NUM ]]
    do
      if [[ $USER_GUESS -gt $RANDOM_NUM ]]
        then
          echo -e "\nIt's lower than that, guess again:"
          read USER_GUESS
          ((NUMBER_OF_GUESSES++))
      elif [[ $USER_GUESS -lt $RANDOM_NUM ]]
        then
          echo -e "\nIt's higher than that, guess again:"
          read USER_GUESS
          ((NUMBER_OF_GUESSES++))
      fi
    done
  
  # If it's guessed, tell user add it to the db
  echo -e "You guessed it in $NUMBER_OF_GUESSES tries. The secret number was $RANDOM_NUM. Nice job!"

  INSERT_GAME_RESULT=$($PSQL "INSERT INTO games (random_number, number_of_guesses, user_id)
                                VALUES ($RANDOM_NUM, $NUMBER_OF_GUESSES, $USER_ID)")
  
}

START_GAME