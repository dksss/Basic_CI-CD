#!/bin/bash

scp ../build/* jodyvole@10.20.0.20:/usr/local/bin/

if [ $? -eq 0 ]
then
    echo "Deploy status: OK"
    exit 0
else
    echo "Deploy status: FAIL"
    exit 1
fi
