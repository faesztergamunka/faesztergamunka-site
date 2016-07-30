#!/bin/bash

echo "Convert jpg..."

for i in ./*/*.jpg; do
    is_small=$(echo `basename $i` | grep -E "_small.jpg$" | wc -l)
    if [ "$is_small" == "1" ]; then
        continue
    fi
    echo -n "$i ... "
    outpath=`dirname $i`"/"`basename -s .jpg $i`"_small.jpg"
    convert "$i" -compress jpeg -adaptive-resize 350x "$outpath"
    if [ "$?" != "0" ]; then
        echo "ERROR"
        exit 2
    fi
    echo "OK"
done
