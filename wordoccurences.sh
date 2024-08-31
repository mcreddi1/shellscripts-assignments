#!/bin/bash

file=$1
searchword=$2

USAGE (){

    echo "USAGE: sh scriptname <filename> <search_word> "
}

if [ $# -lt 2 ]
then
    USAGE
    exit 1
fi

if [ ! -f $file ]
then 
    echo "file not exists"
    exit 1
else
    echo "$file exists"
fi

awk 'BEGIN{ FS="[ \t\n]+" } { for (i=1; i<=NF; i++) count[$i]++ } END{ for (word in count) print word, count[word] }' "$2" |
# Sort output by count in descending order, then by word alphabetically
sort -k2,2nr -k1,1 |
# Display top 5 most frequent words
head -n 5 |
# Format output
awk '{ printf("%-15s : %d\n", $1, $2) }'

