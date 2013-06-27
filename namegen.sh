#!/bin/bash
File="namespace"
location="namespaces"

delete=0
case $1 in
    -i)
        if [[ -f $location/$2 ]]
        then
            cp $location/$2 $File 
                exit 0
        else
            echo "File not found! Use $0 -l"
            exit 2
        fi ;;
    -l)
        ls $location 
            exit 0 ;;
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
name=`awk -v n=$rnd 'NR ==n' $File`

echo $name
if [[ delete -eq 1 ]]
then
    sed "$rnd d;" $File > $File
fi
