What is Shell ?
    A Shell is a place where we execite the several commands in one place to interact with the Operating System Files and storages

Why Shell Scripts?
    To Automate the repetative tasks 
    Automating the Software Installations
    Automating the Security and software patches
    Automating the Updates
    Monitoring the system alarms
    Raise Notifications Based on the requirements
    troubleshoot and audit logs
    Cronjobs for repatative tasks montly,hourly etc..

To connect with any server we need to use the command --> ssh -i <private-key-filepath> username@ipaddress.

Variables: 
    Declaring Inside the Script
    Using Commands Inside the Script 
    Taking The Variables from Command Line
    read command

Conditions :

If else conditions:

    if [ x -ne y ]
    then
        echo "These statements will execute"
    else
        echo "These Statements will execute"
    fi
Nested If else:

    if [ x -ne y ]
    then
            if [ y -eq z ]
        then
            echo "These statements will execute"
        else
            echo "These Statements will execute"
        fi
    else
        echo "These Statements will execute"
    fi
    
Exit Status in Shell Script:

$? --> This represents the previous commands status either 0 or 1 

$? == 0  --> represents the previous command is success
$? == 1  --> represents the previous command is failure

Functions in shell script:

    validation (){
        conditions to be written here
    }

Redirections in Shell Script:

    > represents adding content to the file 
    >> represents the appending the content to the file 
    1> --> represents the success in redirections
    2> --> represents the failure in redirections
    &> --> reprents the success and failure messages
    &>> --> represents the appending the both succcess and failure messages

Formatting in Shell Scripting:

    date + %F-%H-%M-%S
    date +%F:%M:%S:%MM
    % --> Represents the Formatting the linux shell

Special Variables:
    
    $0 --> represents the script name
    $? --> Represents exit status
    $# --> No of Arguments Passed
    $@ --> Print all the arguments passed over CLI
    $1 --> First Variable
    $2 --> Second Variable

Loops In Shell Scripting:
    for Loops
    while Loops
    do while Loops

For Loops:
    for i in {1..10}
    do 
        echo "$i"
    done

while loops:
    initialization 
    while(initalization -gt somenumber)
    do
    echo "print"
    done

Until Loops:
    it will use till the particular condition is met

Concepts :

    Variables
    Data Types
    Loops
    Conditions
    Functions
    SpecialVariables
    Colors

Delete Files Older Than 14 days

find <location-of-files> - name "*.log" -type f -mtime +14 | rm -rf


SED --> Stream Editor In Linux

    sed -i s/<search-word>/<replace-word>/g <file-name>

    we can use anything as delimiter 
    sed -i 's.<search-word>.<replace-word>g' <file-name> 
    





    