#!/bin/bash
File="namespace"
location="namespaces"

case $1 in
    -i)
        if [[ -f $location/$2 ]]
        then
            cp $location/$2 $File 
        else
            echo "File not found! Use $0 -l"
            exit 2
        fi ;;
    -l)
        ls $location
esac

if [[ !( -f $File )]] 
then
    echo "No File loaded! Use $0 -i \$namespace"
    exit 1
fi
