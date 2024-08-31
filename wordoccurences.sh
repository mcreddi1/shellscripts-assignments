#!/bin/bash

file=$1
searchword=$2

USAGE (){

    echo "USAGE: sh scriptname <filename> <search_word> "
}

if [ $# -lt 2 ]
then
    USAGE
fi

if [ ! -f $file ]
then 
    echo "file not exists"
    exit 1
else
    echo "$file exists"
fi

