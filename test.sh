#!/bin/bash
file="./file"
# if [ -e $file ]; then
# 	echo "File exists"
# else 
# 	echo "File does not exists"
# fi 

while ! test -f $file; do
  sleep 10
  echo "Still waiting"
done

echo "got it"