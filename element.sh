#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"

if [[ -z $1 ]]
  then
    echo -e "Please provide an element as an argument."
  else
    #if is a atomic_number
    if [[ $1 =~ ^[0-9]+$ ]]
    then
      #search el elements table
      ATOMIC_NUMBER=$1
      SYMBOL=$($PSQL "SELECT symbol FROM elements WHERE atomic_number=$ATOMIC_NUMBER;")
      NAME=$($PSQL "SELECT name FROM elements WHERE atomic_number=$ATOMIC_NUMBER;")
      if [[ -z $SYMBOL ]]
      then
        #element not found
        FOUND=0
      else
        FOUND=1      
      fi
    elif [[ ! $1 =~ .{3,} ]]
    then
      #if is a symbol
      SYMBOL=$1
      ATOMIC_NUMBER=$($PSQL "SELECT atomic_number FROM elements WHERE symbol='$SYMBOL';")
      NAME=$($PSQL "SELECT NAME FROM elements WHERE symbol='$SYMBOL';")
      if [[ -z $ATOMIC_NUMBER ]]
      then
        FOUND=0
      else
        FOUND=1  
      fi

    else
      #if is a name
      NAME=$1
      ATOMIC_NUMBER=$($PSQL "SELECT atomic_number FROM elements WHERE name='$NAME';")
      SYMBOL=$($PSQL "SELECT symbol FROM elements WHERE name='$NAME';")
      if [[ -z $ATOMIC_NUMBER ]]
      then
        FOUND=0
      else
        FOUND=1  
      fi
    fi
    if [[ $FOUND = 0 ]]
    then
      echo -e "I could not find that element in the database."
    elif [[ $FOUND = 1 ]]
    then
      #search in properties
      ATOMIC_MASS=$($PSQL "SELECT atomic_mass FROM properties WHERE atomic_number=$ATOMIC_NUMBER;")
      MELTING=$($PSQL "SELECT melting_point_celsius FROM properties WHERE atomic_number=$ATOMIC_NUMBER;")
      BOILING=$($PSQL "SELECT boiling_point_celsius FROM properties WHERE atomic_number=$ATOMIC_NUMBER;")
      TYPE_ID=$($PSQL "SELECT type_id FROM properties WHERE atomic_number=$ATOMIC_NUMBER;")
      TYPE=$($PSQL "SELECT type FROM types WHERE type_id=$TYPE_ID;")

      if [[ -z $ATOMIC_MASS ]]
      then
        #not found properties
        echo -e "The element properties not found"
      else
        echo -e "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING celsius and a boiling point of $BOILING celsius."
      fi
    fi
  fi
