#!/bin/bash

FIle=$1
searchword=$2

usage (){

    echo "sh scriptname <filename> <search_word> "
}

if [ $# -lt 2 ]

    echo "usage: $usage"
    exit 1
fi