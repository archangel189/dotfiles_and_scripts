#!/bin/bash

for FILE in `ls`; do
    if [ $FILE != "zip-all.sh" ]; then
        zip -r "${FILE}.zip" $FILE
    fi
done
