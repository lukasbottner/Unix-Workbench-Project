.PHONY: readme.md
readme.md:
	echo "# Guessing Game Project" > readme.md
	echo "" >> readme.md
	echo "This Bash script allows the user to guess the number of all items (including hidden ones) in the current directory." >> readme.md
	echo "" >> readme.md
	echo "## Date and Time make was run:" >> readme.md
	date >> readme.md
	echo "" >> readme.md
	echo "## Number of lines of code in guessinggame.sh:" >> readme.md
	grep -vE '^\s*#|^\s*$$' guessinggame.sh | wc -l >> readme.md
