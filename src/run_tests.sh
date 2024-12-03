#!/bin/bash

echo "Testing s21_cat:"
cd ./cat || exit 1
make test -s

echo
echo "\033[0mTesting s21_grep:"
cd ../grep || exit 1
make test -s