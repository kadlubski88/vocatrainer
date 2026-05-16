# Vocatrainer
A simple vocabulary trainer

## How it works
Random keys from a dictionary are displayed. The user enters the value corresponding to the shown key.
The program then checks the answer and reports whether it is correct.
Correct and incorrect answers are counted.

## How to run
~~~
./voca.sh <path to .dic file>
~~~
> Note: If no parameter is provided, voca.dic in the same directory as the script will be used.

> Note: If the specified .dic file does not exists, the file will be created with default structure.

## How to set the vocabulary entries
In the .dic file:
~~~
declare -A dic=(
    ["key"]="value"
)
~~~