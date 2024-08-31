#!/bin/bash

FIle=$1
searchword=$2

usage (){

    echo "USAGE: sh scriptname <filename> <search_word> "
}

if [ $# -lt 2 ]
then
    USAGE
fi