# Vocatrainer
A simple vocabulary trainer in the terminal.

## How it works
Random keys from a dictionary are displayed. The user enters the value corresponding to the shown key.
The program then checks the answer and reports whether it is correct.
Correct and incorrect answers are counted.

The program is shown only on two lines. When exiting only score will stay on the terminal.

## How to run
~~~
./voca.sh <path to .dic file>
~~~
> **NOTE:** If no parameter is provided, voca.dic in the same directory as the script will be used.

> **NOTE:** If the specified .dic file does not exists, the file will be created with default structure.

> **NOTE:** To exit the program, use ctrl + c.

## How to set the vocabulary entries
In the .dic file:
~~~
declare -A dic=(
    ["key"]="value"
)
~~~

## TODO
- Ask more often wrong given values (modify keys array)
- Make it looks better
- Menu for adding/modify entries
- More like a game with points, targets, etc?