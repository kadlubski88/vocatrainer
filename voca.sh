#!/bin/bash

dic_path="${1:-./voca.dic}"
rights=0
wrongs=0

create_dictionary() {
    cat << 'EOF' > "$dic_path"
# Keys will be ask and user need to enter the value.
declare -A dic=(
    ["key"]="value"
    ["example"]="beispiel"
)
EOF
echo "Default dictionary created at $dic_path"
exit 0
}

exit_trap() {
    printf "\033[1B\r\033[K" #erase second line
    printf "\033[1A\r\033[K" #erase first line
    printf "\e[?25h\e[?12h" #show cursor and activate blinking
    printf "right: $rights | wrong: $wrongs\n"
    exit 0
}

trap exit_trap SIGINT

[[ -f "$dic_path" ]] || create_dictionary


. "$dic_path"

printf "\nright: $rights | wrong: $wrongs\033[1A\r"

while :
do
    keys=("${!dic[@]}")
    rnd_index=$(shuf -i 0-$((${#keys[@]} - 1)) -n 1)
    rnd_key="${keys[$rnd_index]}"
    true_value="${dic[$rnd_key]}"
    printf "\033[K%s? " "$rnd_key"
    printf "\e[?25h\e[?12h" #show cursor and activate blinking
    read value
    printf "\e[?25l" #hide cursor
    printf "\033[1A\r\033[K" #go up one line after the user tip on the enter key
    if [[ "$value" == "$true_value" ]]
    then
        printf "\033[32mRight!\033[0m"
        ((rights++))
    else
        printf "\033[31mWrong!\033[0m"
        ((wrongs++))
    fi
    printf " $rnd_key: $true_value\n"
    printf "right: $rights | wrong: $wrongs\033[1A\r"
    sleep 2
done