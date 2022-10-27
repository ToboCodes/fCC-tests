#! /bin/bash
PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"

echo -e "\n### Hair Salon ###\n"

MAIN_MENU() {
  echo -e "\nWelcome!\nHow may I help you?\n"
  # get services
  SERVICES=$($PSQL "SELECT * FROM services ORDER BY service_id")
  # service selection
  echo "$SERVICES" | while read SERVICE_ID BAR SERVICE
  do
    echo "$SERVICE_ID) $SERVICE"
  done
  read SERVICE_ID_SELECTED
  SELECTED_SERVICE=$($PSQL "SELECT name FROM services WHERE service_id=$SERVICE_ID_SELECTED")
  # if service doesn't exist
  if [[ -z $SELECTED_SERVICE ]]
  then
    echo -e "Please pick a valid option."
    MAIN_MENU
  else
    echo -e "\nPlease input your phone number"
    read CUSTOMER_PHONE
    CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone='$CUSTOMER_PHONE'")
    # if customer doesn't exist
    if [[ -z $CUSTOMER_NAME ]]
    then
      # new customer
      echo -e "\nPlease input your name"
      read CUSTOMER_NAME
      $PSQL "INSERT INTO customers(name, phone) VALUES('$CUSTOMER_NAME', '$CUSTOMER_PHONE')"
    fi
    # get customer_id
    CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")
    # get service_time
    echo -e "\nPlease input a time for your appointment"
    read SERVICE_TIME
    # create appointment
    $PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES($CUSTOMER_ID, $SERVICE_ID_SELECTED, '$SERVICE_TIME')"
    echo -e "\nI have put you down for a $SELECTED_SERVICE at $SERVICE_TIME, $CUSTOMER_NAME."
  fi
}

MAIN_MENU