#!/bin/bash
File="namespace"
location="namespaces"
delete=0
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
        ls $location ;;
    -d) 
        delete=1 ;;
esac

if [[ !( -f $File )]] 
then
    echo "No File loaded! Use $0 -i \$namespace"
    exit 1
fi

entries=`wc -l $File | awk {'print $1'}`
rnd=$(( $RANDOM % entries + 1 ))


