#!/bin/bash

echo -n "Enter the first number: "
read VAR1
echo -n "Enter the second number: "
read VAR2
echo -n "Enter the third number: "
read VAR3

if [[ $VAR1 -ge $VAR2 ]] && [[ $VAR1 -ge $VAR3 ]]
then
  echo "$VAR1 is the largest number."
elif [[ $VAR2 -ge $VAR1 ]] && [[ $VAR2 -ge $VAR3 ]]
then
  echo "$VAR2 is the largest number."
else
  echo "$VAR3 is the largest number."
fi

#!/bin/bash
awk '{print $1, $2, $3, $4, $5, $6, $7, $8}' $1 | grep $2 | grep $3 |

echo -n "1: Blackjack" 
echo -n "2: Roulette"
echo -n "3: Texas Hold Em"
read VAR1


if [[ $VAR1 = 1 ]] 
then 
  awk '{print $1, $2, $3, $4}' $1 | grep $2 | grep $3 
elif [[ $VAR1 = 2 ]] 
then
  awk '{print $1, $2, $5, $6}' $1 | grep $2 | grep $3 
elif [[ $VAR1 = 3 ]]
  awk '{print $1, $2, $7, $8}' $1 | grep $2 | grep $3 
else 
  echo 'Input Error Game Not Found' 
