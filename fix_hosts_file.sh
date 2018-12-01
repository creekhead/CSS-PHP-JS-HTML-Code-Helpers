#!/bin/bash
 
if [[ ( -z "$1") || (-z "$2") ]]
then 
  echo "Input/Output is empty"
  echo "Exemple: fix_hosts_file.sh hosts.txt new_hosts.txt"
  exit
fi
 
if [ ! -f $1 ]; then
    echo "Input file not found!"
    exit
fi
 
if [ -f $2 ]; then
    echo "Output file exists!"
    exit
fi

linecount=$( wc -l $1)
echo "Processing $linecount lines in filename: $1"
cat $1 | while read line
do
   wcount=$(echo $line | tr ' ' '\n' | wc -l)
   initial="$(echo $line | head -c 1)"
   new=$line
   if [[ ( "$initial" != "#") && ( "$wcount" -eq 1 ) ]]; then
      new="0.0.0.0 $line"
   fi
 
   echo $new >> $2
done
