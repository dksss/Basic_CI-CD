SUCCESS=0 FAIL=0 COUNTER=0
RED=$"\033[91m" GREEN=$"\033[92m"
MY_UTIL_NAME=s21_grep ORIGINAL_UTIL_NAME=grep
files=(./test_files/test1.txt ./test_files/test2.txt ./test_files/test3.txt)
flags=(-i -v -c -l -n -h -s -o)
special_flags=(-e -f)
examples=(1337 test prov ^t 1..7 qwer)
files_with_regular_expressions=(./test_files/reg1.txt ./test_files/reg2.txt)

# 1 флаг 1 файл
for file in "${files[@]}"
do
    for flag in "${flags[@]}"
    do
        for example in "${examples[@]}"
        do
            MY_UTIL_COMMAND="./$MY_UTIL_NAME $flag $example $file"
            ORIGINAL_UTIL_COMMAND="$ORIGINAL_UTIL_NAME $flag $example $file"
            $MY_UTIL_COMMAND > my_util_result.txt
            $ORIGINAL_UTIL_COMMAND > original_util_result.txt
            if diff -q my_util_result.txt original_util_result.txt >/dev/null 2>&1;
            then
                let "COUNTER++"
                let "SUCCESS++"
            else
                let "COUNTER++"
                let "FAIL++"
            fi
            rm my_util_result.txt
            rm original_util_result.txt
        done
    done
done

# 1 флаг и несколько файлов

for flag in "${flags[@]}"
do
    for example in "${examples[@]}"
    do
        MY_UTIL_COMMAND="./$MY_UTIL_NAME $flag $example ${files[@]}"
        ORIGINAL_UTIL_COMMAND="$ORIGINAL_UTIL_NAME $flag $example ${files[@]}"
        $MY_UTIL_COMMAND > my_util_result.txt
        $ORIGINAL_UTIL_COMMAND > original_util_result.txt
        if diff -q my_util_result.txt original_util_result.txt >/dev/null 2>&1;
        then
            let "COUNTER++"
            let "SUCCESS++"
        else
            let "COUNTER++"
            let "FAIL++"
        fi
        rm my_util_result.txt
        rm original_util_result.txt
    done
done

# 2 флага 1 файл

for file in "${files[@]}"
do
    for flag1 in "${flags[@]}"
    do
        for flag2 in "${flags[@]}"
        do
            if [[ "$flag1" != "$flag2" ]]
            then
                for example in "${examples[@]}"
                do
                    MY_UTIL_COMMAND="./$MY_UTIL_NAME $flag1 $flag2 $example $file"
                    ORIGINAL_UTIL_COMMAND="$ORIGINAL_UTIL_NAME $flag1 $flag2 $example $file"
                    $MY_UTIL_COMMAND > my_util_result.txt
                    $ORIGINAL_UTIL_COMMAND > original_util_result.txt
                    if diff -q my_util_result.txt original_util_result.txt >/dev/null 2>&1;
                    then
                        let "COUNTER++"
                        let "SUCCESS++"
                    else
                        let "COUNTER++"
                        let "FAIL++"
                    fi
                    rm my_util_result.txt
                    rm original_util_result.txt
                done
            fi
        done
    done
done

# 2 флага и несколько файлов

for flag1 in "${flags[@]}"
do
    for flag2 in "${flags[@]}"
    do
        if [[ "$flag1" != "$flag2" ]]
        then
            for example in "${examples[@]}"
            do
                MY_UTIL_COMMAND="./$MY_UTIL_NAME $flag1 $flag2 $example ${files[@]}"
                ORIGINAL_UTIL_COMMAND="$ORIGINAL_UTIL_NAME $flag1 $flag2 $example ${files[@]}"
                $MY_UTIL_COMMAND > my_util_result.txt
                $ORIGINAL_UTIL_COMMAND > original_util_result.txt
                if diff -q my_util_result.txt original_util_result.txt >/dev/null 2>&1;
                then
                    let "COUNTER++"
                    let "SUCCESS++"
                else
                    let "COUNTER++"
                    let "FAIL++"
                fi
                rm my_util_result.txt
                rm original_util_result.txt
            done
        fi
    done
done

# Флаги -e, -f и несколько файлов

for file in "${files_with_regular_expressions[@]}"
do
    for flag1 in "${flags[@]}"
    do
        for flag2 in "${flags[@]}"
        do
            if [[ "$flag1" != "$flag2" ]]
            then
                for example in "${examples[@]}"
                do
                    MY_UTIL_COMMAND="./$MY_UTIL_NAME $flag1 $flag2 ${special_flags[0]} $example ${special_flags[1]} $file ${files[@]}"
                    ORIGINAL_UTIL_COMMAND="$ORIGINAL_UTIL_NAME $flag1 $flag2 ${special_flags[0]} $example ${special_flags[1]} $file ${files[@]}"
                    $MY_UTIL_COMMAND > my_util_result.txt
                    $ORIGINAL_UTIL_COMMAND > original_util_result.txt
                    if diff -q my_util_result.txt original_util_result.txt >/dev/null 2>&1;
                    then
                        let "COUNTER++"
                        let "SUCCESS++"
                    else
                        let "COUNTER++"
                        let "FAIL++"
                    fi
                    rm my_util_result.txt
                    rm original_util_result.txt
                done
            fi
        done
    done
done

printf "$GREEN%s\n" "SUCCESS = $SUCCESS"
printf "$RED%s\n" "FAIL = $FAIL"