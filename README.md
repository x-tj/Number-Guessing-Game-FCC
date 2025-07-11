# Number Guessing Game
Solutions divided into several steps :
    1. Prepare database.
    2. Primary Key and Foreign Key assignment.
    3. Compact sql db schema into number_guess.sql.
    4. Prepare git directory.
    5. Prepare shell script file.
    6. Copy scipt line by line, meanwhile commit changes on terminal.
    7. Run The Script.



This is the result to complete the Number Guessing Game project. 
Instructions for building this project can be found at [https://www.freecodecamp.org/learn/relational-database/build-a-number-guessing-game-project/build-a-number-guessing-game](https://www.freecodecamp.org/learn/relational-database/build-a-number-guessing-game-project/build-a-number-guessing-game)

## Instructions
To complete this project, you need to write a script that generates a random number between 1 and 1000 for users to guess. Create a `number_guess` database to hold the information suggested in the user stories. Connect to the interactive psql shell with `psql --username=freecodecamp --dbname=postgres` to create the database. In your script, you can create a PSQL variable for querying the database like this: `PSQL="psql --username=freecodecamp --dbname=<database_name> -t --no-align -c"`. Your script should only ask for input from the user to get the `username` and to take guesses. The tests will add `users` to your database when the script has that ability, feel free to delete those. Some script related `user` stories may not pass until the script is completely working. Don't forget to commit your work frequently.

Notes:
If you leave your virtual machine, your database may not be saved. You can make a dump of it by entering `pg_dump -cC --inserts -U freecodecamp number_guess > number_guess.sql` in a bash terminal (not the psql one). It will save the commands to rebuild your database in `number_guess.sql`. The file will be located where the command was entered. If it's anything inside the project folder, the file will be saved in the VM. You can rebuild the database by entering `psql -U postgres < number_guess.sql` in a terminal where the `.sql` file is.

If you are saving your progress on [freeCodeCamp.org](https://www.freecodecamp.org/), after getting all the tests to pass, follow the instructions above to save a dump of your database. Save the number_guess.sql file, as well as the final version of your number_guess.sh file, in a public repository and submit the URL to it on [freeCodeCamp.org](https://www.freecodecamp.org/).

## CodeRoad
1. Create a `number_guessing_game` folder in the `project` folder for your program.
2. Create `number_guess.sh` in your `number_guessing_game` folder and give it executable permissions.
3. Your script should have a `shebang` at the top of the file that uses `#!/bin/bash`.
4. Turn the `number_guessing_game` folder into a git repository.
5. Your git repository should have at least `five` commits.
6. Your script should randomly generate `a number` that users have to guess.
7. When you run your script, you should prompt the user for a username with Enter your `username:`, and take a `username` as input. Your database should allow usernames that are `22` characters.
8. If that `username` has been used before, it should print `Welcome back, <username>! You have played <games_played> games, and your best game took <best_game> guesses.`, with `<username>` being a `users name` from the database, `<games_played>` being the `total number` of games that user has played, and `<best_game>` being the `fewest number of guesses` it took that user to `win` the game.
9. If the `username` has not been used before, you should print `Welcome, <username>! It looks like this is your first time here.`
10. The next line printed should be `Guess the secret number between 1 and 1000:` and input from the user should be read
11. Until they guess the secret number, it should print `It's lower than that, guess again:` if the previous input was `higher` than the secret number, and `It's higher than that, guess again:` if the previous input was `lower` than the `secret number`. Asking for input each time until they input the `secret number`.
12. If anything other than an integer is input as a guess, it should print `That is not an integer, guess again:`
13. When the secret number is guessed, your script should print `You guessed it in <number_of_guesses> tries. The secret number was <secret_number>. Nice job!` and finish running.
14. The message for the first commit should be `Initial commit`.
15. The rest of the commit messages should start with `fix:`, `feat:`, `refactor:`, `chore:`, or `test:`.
16. You should finish your project while on the `main` branch, your working tree should be clean, and you should not have any uncommitted changes.

## Result
![image](https://github.com/user-attachments/assets/2fe38ef8-577e-43a3-b9cf-2f83fd037e7c)
