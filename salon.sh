#! /bin/bash

PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"

MAIN_MENU() {
echo -e "\n~~OUR SERVICES~~"

echo -e "\n1) haircut\n2) coloring\n3) beardtrim"

echo -e "\nselect a service please"
read SERVICE_ID_SELECTED

if ! [[ "$SERVICE_ID_SELECTED" =~ ^[123]$ ]] 
then
 MAIN_MENU "invalid service choice"
 else 
 if [[ "$SERVICE_ID_SELECTED" = 1 ]]
 then
 SERVICE="haircut"
 echo -e "\n~~ORDER HAIRCUT~~"
 echo -e "\nWhat is your Phonenumber?"
 read CUSTOMER_PHONE
CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone='$CUSTOMER_PHONE'")

 if [[ -z $CUSTOMER_NAME ]]
 then 
 echo -e "\nYou are new here!"
 echo -e "\nWhat is your name?"
 read CUSTOMER_NAME
 echo -e "\nWhat time do you want?, $CUSTOMER_NAME"
read SERVICE_TIME
INSERTION=$($PSQL "INSERT INTO customers(phone, name) VALUES ('$CUSTOMER_PHONE', '$CUSTOMER_NAME')");
CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")
INSERTION2=$($PSQL "INSERT INTO appointments (service_id, customer_id, time) VALUES ($SERVICE_ID_SELECTED, $CUSTOMER_ID, '$SERVICE_TIME') ")
 echo -e "I have put you down for a $SERVICE at $SERVICE_TIME, $CUSTOMER_NAME."
 else
 echo -e "\nWhat time do you want?, $CUSTOMER_NAME"
 read SERVICE_TIME
CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")
INSERTION2=$($PSQL "INSERT INTO appointments (service_id, customer_id, time) VALUES ($SERVICE_ID_SELECTED, $CUSTOMER_ID, '$SERVICE_TIME') ")
 echo -e "I have put you down for a $SERVICE at $SERVICE_TIME, $CUSTOMER_NAME."
 fi

 fi
 if [[ "$SERVICE_ID_SELECTED" = 2 ]]
 then
 SERVICE="coloring"
 echo -e "\n~~ORDER coloring~~"
 echo -e "\nWhat is your Phonenumber?"
 read CUSTOMER_PHONE
CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone='$CUSTOMER_PHONE'")

 if [[ -z $CUSTOMER_NAME ]]
 then 
 echo -e "\nYou are new here!"
 echo -e "\nWhat is your name?"
 read CUSTOMER_NAME
 echo -e "\nWhat time do you want?, $CUSTOMER_NAME"
read SERVICE_TIME
INSERTION=$($PSQL "INSERT INTO customers(phone, name) VALUES ('$CUSTOMER_PHONE', '$CUSTOMER_NAME')");
CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")
INSERTION2=$($PSQL "INSERT INTO appointments (service_id, customer_id, time) VALUES ($SERVICE_ID_SELECTED, $CUSTOMER_ID, '$SERVICE_TIME') ")
 echo -e "I have put you down for a $SERVICE at $SERVICE_TIME, $CUSTOMER_NAME."
 else
 echo -e "\nWhat time do you want?, $CUSTOMER_NAME"
 read SERVICE_TIME
CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")
INSERTION2=$($PSQL "INSERT INTO appointments (service_id, customer_id, time) VALUES ($SERVICE_ID_SELECTED, $CUSTOMER_ID, '$SERVICE_TIME') ")
 echo -e "I have put you down for a $SERVICE at $SERVICE_TIME, $CUSTOMER_NAME."
 fi

 fi
 if [[ "$SERVICE_ID_SELECTED" = 3 ]]
 then
 SERVICE="beardtrim"
 echo -e "\n~~ORDER beardtrim~~"
 echo -e "\nWhat is your Phonenumber?"
 read CUSTOMER_PHONE
CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone='$CUSTOMER_PHONE'")

 if [[ -z $CUSTOMER_NAME ]]
 then 
 echo -e "\nYou are new here!"
 echo -e "\nWhat is your name?"
 read CUSTOMER_NAME
 echo -e "\nWhat time do you want?, $CUSTOMER_NAME"
read SERVICE_TIME
INSERTION=$($PSQL "INSERT INTO customers(phone, name) VALUES ('$CUSTOMER_PHONE', '$CUSTOMER_NAME')");
CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")
INSERTION2=$($PSQL "INSERT INTO appointments (service_id, customer_id, time) VALUES ($SERVICE_ID_SELECTED, $CUSTOMER_ID, '$SERVICE_TIME') ")
 echo -e "I have put you down for a $SERVICE at $SERVICE_TIME, $CUSTOMER_NAME."
 else
 echo -e "\nWhat time do you want?, $CUSTOMER_NAME"
 read SERVICE_TIME
CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")
INSERTION2=$($PSQL "INSERT INTO appointments (service_id, customer_id, time) VALUES ($SERVICE_ID_SELECTED, $CUSTOMER_ID, '$SERVICE_TIME') ")
 echo -e "I have put you down for a $SERVICE at $SERVICE_TIME, $CUSTOMER_NAME."
 fi

 fi
fi
}


MAIN_MENU
