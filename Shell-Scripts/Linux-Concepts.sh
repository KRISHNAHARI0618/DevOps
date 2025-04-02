Some More representational Commands:

copy,mv,grep,find,head,tail,

fgrep(grep -F) : Represents Fixed length of the string
fgrep "search_pattern" filename

egerp(Grep -E) : Extended regular expression
egrep "pattern" filename

grep --> searcg the text in a file / to find the text in file
grep <word-to-find> <file-name>
grep -i <word-to-find> <file-name> --> to find the word in case insensitive way
grep --> global regular expression

Piping Concepts:
----------------
    in piping one commands output is act as a another commands input

    grep -i <word-to-find> <file-name> | cat > text.txt

    head <file-name> --> gives first 10 lines of the file
    tail <file-name> --> gives last 10 lines of the file

    head -n <no.of.lines to show> <file-name> --> show particular no of lines

Downloading the files:
----------------------
    wget & curl

    wget --> means web get --> download the file from online website

    curl --> it will print the content in screen

Breaking the content/file text:
------------------------------
    cut and awk

    cut will cut the content based on we given command

    cut -d <delimiter> -f <fragments> 1-4

    awk command:

    awk -F "delimiter" '{print $1F}'
    awk -F "delimiter" '{print $1F}'
    awk is column based command and by default it will get the space as a delimter

Editor Commands:
----------------
    VIM --> Visually Improved Module Editor

    :/<Word to search> --> searches for a word from top to bottom
    :? <word to search> --> Searches for a word from bottom to top
    :q --> quit the file
    :wq --> save and quit the file
    :noh --> no highlight
    :nonu --> No Number
    :nu --> numbering the file
    :setnu --> Set Number of the file
    :set nonu  --> Set No Number

    Insert Mode:
    ------------
    https://www.unomaha.edu/college-of-information-science-and-technology/computer-science-learning-center/_files/resources/CSLC-Helpdocs-Vim.pdf


Permissions in Linux:
---------------------
R --> read
W --> write
X --> Execute

rwx --> Read Write Execute

r --> represents 4
w --> represents 2
x --> represents 1

rwx --> represents --> 7
r_x --> represents --> 5

directory_User_Group_Others
d_rwx_rwx_rwx --> all access for all users,groups and others

Command used to change the permissions for a file is :

chmod u+rwx,g+rx,o+x passwd


User Management In linux:

CRUD Operations:
Create user --> useradd <user-name>
Update user -->
Delete user -->
Read user -->
All the user information is stored in /etc/passwd folder


How to Create the password?

passwd <username>

Group Management In linux:


Adding user to Group

Create Group --> groupadd <groupname>

addding user to group --> usermod -g <groupname> <user-name>

adding secondary group --> usermod -aG <group-name> <user-name>

delete the user from group --> gpasswd -d <user-name> <group-name>

Delete the group:
we cannot delete the group when the users are there in that group
only no users can delete the group

first remove users -->
usermod -g <group-name> <user-name>
then
gpasswd -d <user-name> <group-name>

groupdel <group-name>

Everything in the linux is the process :

ps --> process
ps -ef --> shows all process ids and ppid(parent process ids)
ppid is the parent process id to whom we need to report immediatly

There are two types of process
1) Foreground Process
2) Background Process

Kill The process:
kill pid --> killing the process
kill -9 pid --> Forced Klling the process.

To list down all the process:
top --> it will list down all the process,cpu,memory,diskusage everything will be showed with this command

Package Management:
Installing the packages in the system
commands :
ubuntu : apt-get
centos : yum
aws-linux : amazon-linux-extras
fedora : dnf

Service Management:
Every Server has 0 - 65535 Ports
by default there is some ports fixed

Default Ports fixed for servers (TCP)

all TCP --> 0 - 65535 ports
nginx --> port no : 80
https --> port no : 443
http --> port no : 80
ftp --> port no : 25
ssh --> port no : 22
jenkins --> port no : 8080


How to start the package as a service :

systemctl start <package-name> --> Starting the Package
systemctl status <package-name>  --> Status of the Package
systemctl restart <package-name> --> restarting he Package

Network Management:

Internet works on Transfer Control Protocol
netstat --> Netwok Stattistics
netstat -lt --> list down all tcps
netstat -lntp --> all ports ,port numbers etc..
ps -ef | grep nginx
top --> you can check the cpu and memory statistic
free -m --> free memory
free -m --> Ram usage also can check
df -hT --> Disk Free hard Disk Free checking

How to list all interfaces in linux?
ip link show
ip route --> can be used to display or modify the existing IP routing table
ping -->
netstat
traceroute -->
telnet --> useed to connect outside ip address

Linux File System :

/ --> Linux Start directory
# --> represents this is in root User
/boot --> when os started Linux will search for windows directory
it will load grub.cfg
/root --> it is the home folder for admin user /root
/dev --> all our disks,had disks, keyboards,mouse etcc.. is attched to linux systems ... Devices - dev
/etc --> extra configurations configuration related to appications , services and packages will be here.
/home --> where all users related info will be there
/lib --> libraries/dependencies ,packages and commands  related to systems , where it should depends on this files to run
/opt --> optional files,when we install any 3rd party software/libraries/packages/services it will got to optional folders.
/proc --> process related information will be store here
/run --> used to run the services when os is loading when os is loading it need some temporary files to run the system
/bin --> binaries commands ,our regular using commands will be stored inside the bin /binaries user Commands
/sbin --> system binaries particularly admin related commands will be stored here
/tmp --> store some temporary file.
/usr --> user inofrmation will be stored
/var --> variables when linux serevr is running it will store lots of log files will be stored all info about server will be stored
system messages will be stored here only

inode ,softlink(symlink)(symbolic link) and hard link
Humans dont understand numbers
computers dont understand names only numbers

In linux everything is a file system
for each file it has one unique code that is inode
it is the pointer for every file in the linux file System

Softlink or Symbolic Link or Sym link
inode --> symlink
ln -s <location of file> <soft-link-name>

hard link
ln <source-file-path> <destination-link-name>

what will happen if we remove source file?
for soft link --> cannot have access or retrieve the data
for hard link --> can open the file becuase inode is same for both files.

tar command:
ziping and unzipping

Cron tab:

* * * * *  --> min hour day-of-month month day-of-week
10 * * * * --> every 10 minutes

* * * * * <command>

* * * * * echo "hello i am executed at $(date) " >> execution.log

crontab -e --> to give the execution command
