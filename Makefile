README.md:
	echo "# Guessing Game Project" > README.md
	echo "" >> README.md
	echo "This is a Bash script where the user guesses how many files and directories (including hidden ones) are in the current directory." >> README.md
	echo "" >> README.md
	echo "## Date and Time make was run:" >> README.md
	date >> README.md
	echo "" >> README.md
	echo "## Number of lines in guessinggame.sh:" >> README.md
	wc -l < guessinggame.sh >> README.md
