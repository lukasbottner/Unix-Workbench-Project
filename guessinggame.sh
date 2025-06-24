#!/usr/bin/env bash

if ! command -v bc > /dev/null 2>&1; then
    echo "Error: 'bc' is not installed. Please install it to run this script."
    exit 1
fi

count_all_items() {
    find . -mindepth 1 -maxdepth 1 | wc -l
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

        if [ "$(echo "$guess < $correct_count" | bc)" -eq 1 ]; then
            echo "Too low. Try again."
        elif [ "$(echo "$guess > $correct_count" | bc)" -eq 1 ]; then
            echo "Too high. Try again."
        else
            echo 'Congratulations! You guessed it!'
            break
        fi
    done
}

play_game
