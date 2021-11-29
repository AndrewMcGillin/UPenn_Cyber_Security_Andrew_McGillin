#!/bin/bash

states=('Pennsylvania' 'New Jersey' 'Virginia' 'Florida' 'Maine')

for state in ${states[@]}
do
          if [ $states = 'Hawaii' ]
          then
          echo "Hawaii is the best!"
          else
          echo "I am not fond of Hawaii."
         fi
done


nums=$(echo {0..9})

for num in ${nums[@]}
do
    if [ $num = 3 ] || [ $num = 5 ] || [$num = 7 ]
   then
      echo $num
   fi
