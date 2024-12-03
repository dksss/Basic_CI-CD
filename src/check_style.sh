#!/bin/bash

clang-format -style=Google  -Werror -n ./*/*.c ./*/*.h

if [ $? -eq 0 ]
then
    echo "Style test: OK"
    exit 0
else
    echo "Style test: FAIL"
    exit 1
fi
