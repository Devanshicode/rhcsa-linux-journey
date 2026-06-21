
# Group - 1 Linux Bash Scripting Fundamentals










| Construct                | What It Does                               | When I Use It                                  |
| ------------------------ | ------------------------------------------ | ---------------------------------------------- |
| `#!/bin/bash`            | Specifies Bash interpreter                 | Every Bash script                              |
| `set -e`                 | Stops script when a command fails          | Automation and deployment scripts              |
| `if [ condition ]; then` | Runs commands only if condition is true    | File checks, validations, decisions            |
| `while condition; do`    | Repeats commands while condition is true   | Monitoring and waiting loops                   |
| `$0`                     | Script name                                | Logging and debugging                          |
| `$1`                     | First argument                             | User input to script                           |
| `$2`                     | Second argument                            | Additional user input                          |
| `$@`                     | All arguments                              | Processing multiple inputs                     |
| `$#`                     | Number of arguments                        | Validation of inputs                           |
| `trap 'command' EXIT`    | Executes cleanup command when script exits | Temporary file cleanup and resource management |







# Group - 2 Bash Scripting Fundamentals







| Concept              | Example                         | What It Does                  | When I Use It               |
| -------------------- | ------------------------------- | ----------------------------- | --------------------------- |
| Array                | `SERVERS=('web1' 'web2' 'db1')` | Stores multiple values        | Managing multiple servers   |
| Variable             | `NAME='devanshi'`               | Stores single value           | Reusable data in scripts    |
| Variable Expansion   | `${NAME}`                       | Retrieves variable value      | Printing or using variables |
| if [[ ]]             | `if [[ $UID -eq 0 ]]`           | Conditional execution         | Permission checks           |
| case                 | `case $1 in`                    | Multi-way decision making     | Menu systems, scripts       |
| Exit Code            | `$?`                            | Shows previous command result | Error handling              |
| Command Substitution | `DATE=$(date ...)`              | Stores command output         | Dynamic values in scripts   |
| for Loop             | `for S in ${SERVERS[@]}`        | Repeats action for each item  | Server automation           |
| ping -c1             | `ping -c1 google.com`           | Sends one ping packet         | Connectivity testing        |
| awk                  | `awk 'NR==2 {print $5}'`        | Extracts specific text        | Parsing command output      |






# Group - 3 Bash Scripting, Logging & Text Processing









| Command / Concept          | What It Does                   | When I Use It                         |
| -------------------------- | ------------------------------ | ------------------------------------- |
| `cat << EOF`               | Multi-line input using Heredoc | Creating configs and scripts          |
| `cat < /etc/motd`          | Redirect file as input         | Reading file through command          |
| `grep -E 'regex' file`     | Pattern matching using regex   | Searching logs and text               |
| `logger -t myscript "msg"` | Write message to system log    | Logging from scripts                  |
| `getopts`                  | Parse command-line options     | Professional shell scripts            |
| `shellcheck script.sh`     | Check bash script for mistakes | Before executing or deploying scripts |





# Group - 4 Input, Loops, Functions, Error Handling & Arithmetic









| Command            | What It Does                  | When I Use It                 |
| ------------------ | ----------------------------- | ----------------------------- |
| `read -p`          | Takes interactive user input  | Username, filenames, choices  |
| `read -sp`         | Takes hidden input            | Passwords, secrets            |
| `for USER in ...`  | Loops through list            | User creation, automation     |
| `for i in {1..10}` | Loops through range           | Repeated tasks                |
| `function()`       | Creates reusable code         | Logging, validation, backups  |
| `set -e`           | Stops script on error         | Production scripts            |
| `set -u`           | Errors on undefined variables | Prevent scripting bugs        |
| `$(( ))`           | Performs integer arithmetic   | Counters, calculations, sizes |
