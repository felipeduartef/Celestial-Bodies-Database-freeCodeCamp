#!/bin/bash


PSQL="psql --username=freecodecamp --dbname=postgres -t --no-align -c"

GAME() {

    
    USER_NAME=$1
    GAMES_PLAYED=$2
    BEST_GAME=$3
    SECRET_NUMBER=$($PSQL "SELECT floor(random() * 1000) + 1 AS random_number;")
    RAMDON_NUMBER=$((RANDOM % 1000 + 1))
    
    echo -e "\nGuess the secret number between 1 and 1000:"
    read ENTER_NUMBER


    NUMBER_TRIES=1
    FLAG="true"
    while [ "$FLAG" != "false" ]; do
        if [[ "$ENTER_NUMBER" =~ ^[0-9]+$ ]]
        then
            if [ "$ENTER_NUMBER" -eq "$SECRET_NUMBER" ]; then
                FLAG="false"
                INSERT_GAMES_PLAYED=$($PSQL "UPDATE users SET games_played = $GAMES_PLAYED + 1 WHERE user_name='$USER_NAME';")
                if [ "$NUMBER_TRIES" -lt "$BEST_GAME" ]; then
                    INSERT_BEST_GAME=$($PSQL "UPDATE users SET best_game = $NUMBER_TRIES WHERE user_name='$USER_NAME';")
                fi
                echo "You guessed it in $NUMBER_TRIES tries. The secret number was $SECRET_NUMBER. Nice job!"
            elif [ "$ENTER_NUMBER" -lt "$SECRET_NUMBER" ]; then
                ((NUMBER_TRIES++))
                echo "It's lower than that, guess again:"
                read ENTER_NUMBER
            elif [ "$ENTER_NUMBER" -gt "$SECRET_NUMBER" ]; then
                ((NUMBER_TRIES++))
                echo "It's higher than that, guess again:"
                read ENTER_NUMBER
            fi
        else
            echo -e "That is not an integer, guess again:"
            read ENTER_NUMBER
        fi
    done

}


echo -e "\nEnter your username:"
read USER_NAME


GAMES_PLAYED=$($PSQL "SELECT games_played FROM users WHERE user_name='$USER_NAME';")
BEST_GAME=$($PSQL "SELECT best_game FROM users WHERE user_name='$USER_NAME';")


if [[ -z $GAMES_PLAYED ]]
then
    echo "Welcome, $USER_NAME! It looks like this is your first time here."
    GAMES_PLAYED=0
    BEST_GAME=1000000
    INSERT_NEW_USER=$($PSQL "INSERT INTO users(user_name,games_played, best_game) VALUES('$USER_NAME', $GAMES_PLAYED, $BEST_GAME);")
    GAME $USER_NAME $GAMES_PLAYED $BEST_GAME $RAMDON_NUMBER

else
    
    echo "Welcome back, $USER_NAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
    GAME $USER_NAME $GAMES_PLAYED $BEST_GAME $RAMDON_NUMBER

fi
