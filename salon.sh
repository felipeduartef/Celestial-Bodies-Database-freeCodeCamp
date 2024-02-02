#! /bin/bash

echo -e "\n~~~~~ Salon Services ~~~~~\n"

PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"

SERVICES=$($PSQL "SELECT * FROM services;")

MAIN_MENU(){
  if [[ $1 ]]
  then
    echo -e "\n$1 How may I help you?"
    echo -e "\n1) design_project\n2) build_project\n3) Maintenance_project"
    read SERVICE_ID_SELECTED
  else
    echo "How may I help you?" 
    echo -e "\n1) design_project\n2) build_project\n3) Maintenance_project"
    read SERVICE_ID_SELECTED
  fi
  case $SERVICE_ID_SELECTED in
    1) DESIGN ;;
    2) BUILD ;;
    3) MAINTENANCE ;;
    *) MAIN_MENU "Please enter a valid option." ;;
  esac
}

DESIGN() {
  echo -e "\nWhat's your phone number:"
  read CUSTOMER_PHONE

  CUSTOMER_INFO=$($PSQL "SELECT * FROM customers WHERE phone='$CUSTOMER_PHONE';")

  if [[ ! -z $CUSTOMER_INFO ]]
  then
    echo -e "\nIndicate the time you wish to reserve:"
    read SERVICE_TIME
  else
    echo -e "\nWhat's your name:"
    read CUSTOMER_NAME

    echo -e "\nIndicate the time you wish to reserve:"
    read SERVICE_TIME

    #add new customer
    ADD_NEW_CUSTOMER=$($PSQL "INSERT INTO customers(phone, name) VALUES('$CUSTOMER_PHONE','$CUSTOMER_NAME');")
    
  fi
  #get customer_id
  CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE';")
  #add new appointment
  ADD_APPOINTMENT=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES($CUSTOMER_ID, 1,'$SERVICE_TIME');")
  echo -e "\nI have put you down for a design_project at $SERVICE_TIME, $CUSTOMER_NAME."
}

BUILD(){
  echo -e "\nWhat's your phone number:"
  read CUSTOMER_PHONE

  CUSTOMER_INFO=$($PSQL "SELECT * FROM customers WHERE phone='$CUSTOMER_PHONE';")

  if [[ ! -z $CUSTOMER_INFO ]]
  then
    echo -e "\nIndicate the time you wish to reserve:"
    read SERVICE_TIME
  else
    echo -e "\nWhat's your name:"
    read CUSTOMER_NAME

    echo -e "\nIndicate the time you wish to reserve:"
    read SERVICE_TIME

    #add new customer
    ADD_NEW_CUSTOMER=$($PSQL "INSERT INTO customers(phone, name) VALUES('$CUSTOMER_PHONE','$CUSTOMER_NAME');")
    
  fi
  #get customer_id
  CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE';")
  #add new appointment
  ADD_APPOINTMENT=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES($CUSTOMER_ID, 2,'$SERVICE_TIME');")
  echo -e "\nI have put you down for a build_project at $SERVICE_TIME, $CUSTOMER_NAME."

}

MAINTENANCE(){
  echo -e "\nWhat's your phone number:"
  read CUSTOMER_PHONE

  CUSTOMER_INFO=$($PSQL "SELECT * FROM customers WHERE phone='$CUSTOMER_PHONE';")

  if [[ ! -z $CUSTOMER_INFO ]]
  then
    echo -e "\nIndicate the time you wish to reserve:"
    read SERVICE_TIME
  else
    echo -e "\nWhat's your name:"
    read CUSTOMER_NAME

    echo -e "\nIndicate the time you wish to reserve:"
    read SERVICE_TIME

    #add new customer
    ADD_NEW_CUSTOMER=$($PSQL "INSERT INTO customers(phone, name) VALUES('$CUSTOMER_PHONE','$CUSTOMER_NAME');")
    
  fi
  #get customer_id
  CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE';")
  #add new appointment
  ADD_APPOINTMENT=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES($CUSTOMER_ID, 1,'$SERVICE_TIME');")
  echo -e "\nI have put you down for a Maintenence_project at $SERVICE_TIME, $CUSTOMER_NAME."

}

MAIN_MENU
