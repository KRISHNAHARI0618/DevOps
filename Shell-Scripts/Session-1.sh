Linux Operating Systems:
-------------------------
Operating System --> The medium between Hardware and software
Kernel --> The mediator between the Hardware and software 
The operations which need to perform between software and hardware we use a compnent called Kernel
Hardware --> CPU,RAM,IO,Memory,NIC etc..

Why Linux?
-----------
    Free OS
    Open Source
    Secure Compared to Windows
    No need of antivirus
    Lot of distributions --> ubuntu,centos,debian,RHEL,Alpine
    Operating System is very Fast
    Linux is fast because everything in linux is Files
    More Stablity
    High Utility
    High Availability
    
Architecture of Linux Operating System ?
----------------------------------------
Kernel --> Kernel is heart of operating system,component to communicate between hardware and software
    Memory Management
    Device Management
    Handling System Related 
    Process Management
System Libraries
Compilers
User Processors
System Related Softwares

Application --> OS --> Hardware

What is servers ?
----------------
Computation Power has below components
    OS
    RAM
    CPU
    MEMORY
    HD
Inside OS
kernel 
shell
Terminal

How to connect to linux server?
-------------------------------
Authorization and authentication
what you know ? --> Password,Id
what you have ? --> RSA Tokens
Who You are ? --> Fingerprints,Plam,retina


What is Public Key and Private Key ?
------------------------------------

Cryptography is the science of secret writing with the intention of keeping the data secret. Cryptography is classified into symmetric cryptography, asymmetric cryptography, and hashing. 

Private Key: 
In the Private key, the same key (secret key) is used for encryption and decryption. In this key is symmetric because the only key is copied or shared by another party to decrypt the cipher text. It is faster than public-key cryptography. 

Public Key: 
In a Public key, two keys are used one key is used for encryption and another key is used for decryption. One key (public key) is used to encrypt the plain text to convert it into cipher text and another key (private key) is used by the receiver to decrypt the cipher text to read the message.



ssh-keygen -f Filename

ssh -i <private-key file path> devops.pem@ipaddress


Linux Commands Staring:
-----------------------

--> # Means Root user
--> $ Normal User access

[commands] [options] [arguments]

uname --help
uname --> it will give the operating system name 
uname -r --> kernel release
uname -v --> kernel version
-a, --all                print all information, in the following order,
                             except omit -p and -i if unknown:
-s, --kernel-name        print the kernel name
-n, --nodename           print the network node hostname
-r, --kernel-release     print the kernel release
-v, --kernel-version     print the kernel version
-m, --machine            print the machine hardware name
-p, --processor          print the processor type (non-portable)
-i, --hardware-platform  print the hardware platform (non-portable)
-o, --operating-system   print the operating system
    --help     display this help and exit
    --version  output version information and exit

Listing Commands :
------------------
ls -- List the files in present directory
ls -a --> gives list of file includes the dot 
ls -la --> 


System Directory :--> SLASH(/)
------------------------------

CRUD --> Create Read Update Delete
----------------------------------
Create --> how to create files and directories
mkdir --> to create directories
touch --> to create file
command >> file name --> we can create a file


