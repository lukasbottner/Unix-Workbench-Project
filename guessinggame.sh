#!/usr/bin/env bash

count_items() {
    find . -mindepth 1 -maxdepth 1 \( -type f -o -type d \) | wc -l
}

play_game() {
    correct_count=$(count_items)
    echo "Welcome to the guessing game!"
    echo "Guess how many files and directories (including hidden ones) are in the current directory:"

    while true; do
        read -p "Your guess: " guess

        if ! [[ "$guess" =~ ^[0-9]+$ ]]; then
            echo "Please enter a whole number."
            continue
        fi

        guess=$((10#$guess))

        if (( guess < correct_count )); then
            echo "Too low. Try again."
        elif (( guess > correct_count )); then
            echo "Too high. Try again."
        else
            echo "Congratulations! You guessed it!"
            break
        fi
    done
}

play_game
