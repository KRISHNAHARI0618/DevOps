grep -v '^$' filename > filenametoadd
lsof -p --> Give the port numer
lsof -i --> inodes
lsof --> list of open files

Soft link will point file or directory in a different location
hard link is not point directory it will point toonly file 

top command is used to memory and cpu time it will display on screen

0 stdinn
1 stdout
2 stderr

**Grep Commands**
- `grep [option] "pattern" [filename/path/to/file]`
- `grep -v` gives other than searching word 
- `grep -i` grep makes case insensitive
- `grep -n` gives the lines numbers
- `grep -c` gives the count of words appeared
- `grep -w` words count in file
- `grep -l` print lines where word found
- `grep -r` recrusively search for a word or file
- `grep -l` print the lines 
- `grep -i "pattern" file  or path/to/file ` To ignore the upper and lower case while searching using grep command in Linux
- ` grep "pattern" filename` To search everything except given pattern/keyword using grep command in Linux
- ` grep -c "pattern" filename` To print how many times (count) given keyword present in file using grep command in Linux
- ` grep -w "pattern" filename` To search for exact match of given keyword in a file using grep command in Linux
- ` grep -n "pattern" filename ` To print the line no. of matches of given keyword in a file using grep command in Linux
- ` grep -r "pattern" filename ` To search a given keyword in multiple files using grep command in Linux
- `grep -h "pattern" filename ` To suppress file names while search a given keyword in multiple files using grep command in Linux
- `grep -e "pattern1" -e "pattern2" filename` To search multiple keywords in a file using grep command in Linux
- ` ` To search multiple keywords in multiple file using grep command in Linux
- `grep -l ` To only print file names which matches given keywords using grep command in Linux
- `grep -f file1 file2 ` To get the keywords/pattern from a file and match with a another file using grep command in Linux
- ` grep -n "^keyword" filename` To print the matching line which start with given keyword using grep command in Linux
- `grep -n "keyword$" filename ` To print the matching line which end with given keyword using grep command in Linux
- ` grep -R "pattern" filename` Suppose we have 100 files in a directory (dirA) and we need to search a keyword in all the files using grep command in Linux
- `grep -q "pattern" filename ` We can use egrep command for the multiple keywords search using grep command in Linux
- `grep -q "pattern" filename ` If you just wanna search but don't want to print on terminal or If you want to suppress error message using grep command in Linux
- 



