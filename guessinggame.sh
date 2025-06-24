#!/usr/bin/env bash

count_all_items() {
    find . -mindepth 1 -maxdepth 1 | wc -l
}

is_less_than() {
    local a="$1"
    local b="$2"
    a="${a#"${a%%[!0]*}"}"; a="${a:-0}"
    b="${b#"${b%%[!0]*}"}"; b="${b:-0}"
    if (( ${#a} < ${#b} )); then
        return 0
    elif (( ${#a} > ${#b} )); then
        return 1
    elif [[ "$a" < "$b" ]]; then
        return 0
    else
        return 1
    fi
}

play_game() {
    correct_count=$(count_all_items)
    echo "Welcome to the guessing game!"
    echo "Guess how many total items (of any type, including hidden) are in the current directory:"

    while true; do
        read -p "Your guess: " guess

        if ! [[ "$guess" =~ ^[0-9]+$ ]]; then
            echo "Please enter a whole number."
            continue
        fi

        guess="${guess#"${guess%%[!0]*}"}"
        guess="${guess:-0}"

        if is_less_than "$guess" "$correct_count"; then
            echo "Too low. Try again."
        elif is_less_than "$correct_count" "$guess"; then
            echo "Too high. Try again."
        else
            echo 'Congratulations! You guessed it!'
            break
        fi
    done
}

play_game
