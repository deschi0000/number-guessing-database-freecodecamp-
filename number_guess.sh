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
fi



# Else they exist and print back the stats
echo -e "Welcome back, $USERNAME! You have played <games_played> games, and your best game took <best_game> guesses."
