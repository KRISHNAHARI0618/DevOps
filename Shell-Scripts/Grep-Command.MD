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
- Usage: grep [OPTION]... PATTERNS [FILE]...
```
Search for PATTERNS in each FILE.
Example: grep -i 'hello world' menu.h main.c
PATTERNS can contain multiple patterns separated by newlines.

Pattern selection and interpretation:
  -E, --extended-regexp     PATTERNS are extended regular expressions
  -F, --fixed-strings       PATTERNS are strings
  -G, --basic-regexp        PATTERNS are basic regular expressions
  -P, --perl-regexp         PATTERNS are Perl regular expressions
  -e, --regexp=PATTERNS     use PATTERNS for matching
  -f, --file=FILE           take PATTERNS from FILE
  -i, --ignore-case         ignore case distinctions in patterns and data
      --no-ignore-case      do not ignore case distinctions (default)
  -w, --word-regexp         match only whole words
  -x, --line-regexp         match only whole lines
  -z, --null-data           a data line ends in 0 byte, not newline

Miscellaneous:
  -s, --no-messages         suppress error messages
  -v, --invert-match        select non-matching lines
  -V, --version             display version information and exit
      --help                display this help text and exit

Output control:
  -m, --max-count=NUM       stop after NUM selected lines
  -b, --byte-offset         print the byte offset with output lines
  -n, --line-number         print line number with output lines
      --line-buffered       flush output on every line
  -H, --with-filename       print file name with output lines
  -h, --no-filename         suppress the file name prefix on output
      --label=LABEL         use LABEL as the standard input file name prefix
  -o, --only-matching       show only nonempty parts of lines that match
  -q, --quiet, --silent     suppress all normal output
      --binary-files=TYPE   assume that binary files are TYPE;
                            TYPE is 'binary', 'text', or 'without-match'
  -a, --text                equivalent to --binary-files=text
  -I                        equivalent to --binary-files=without-match
  -d, --directories=ACTION  how to handle directories;
                            ACTION is 'read', 'recurse', or 'skip'
  -D, --devices=ACTION      how to handle devices, FIFOs and sockets;
                            ACTION is 'read' or 'skip'
  -r, --recursive           like --directories=recurse
  -R, --dereference-recursive  likewise, but follow all symlinks
      --include=GLOB        search only files that match GLOB (a file pattern)
      --exclude=GLOB        skip files that match GLOB
      --exclude-from=FILE   skip files that match any file pattern from FILE
      --exclude-dir=GLOB    skip directories that match GLOB
  -L, --files-without-match  print only names of FILEs with no selected lines
  -l, --files-with-matches  print only names of FILEs with selected lines
  -c, --count               print only a count of selected lines per FILE
  -T, --initial-tab         make tabs line up (if needed)
  -Z, --null                print 0 byte after FILE name

Context control:
  -B, --before-context=NUM  print NUM lines of leading context
  -A, --after-context=NUM   print NUM lines of trailing context
  -C, --context=NUM         print NUM lines of output context
  -NUM                      same as --context=NUM
      --group-separator=SEP  print SEP on line between matches with context
      --no-group-separator  do not print separator for matches with context
      --color[=WHEN],
      --colour[=WHEN]       use markers to highlight the matching strings;
                            WHEN is 'always', 'never', or 'auto'
  -U, --binary              do not strip CR characters at EOL (MSDOS/Windows)
```
## AWK Command `aho weinberg kernighan`
- Syntax `awk [POSIX or GNU style options] -f progfile [--] file ...`
- `awk '{print}' filename` prints all data in file
- `awk -F '{print $1}'` -F Means Field Seperator
- `awk '{print $NF}' filename` Means Print All Last Fields

## Sed `stream editor`
- `sed -i 's/pattern/change-pattern/' filename` this will change inplace changed and will not show at output but will update values
-  `echo "Hello World" | sed 's.\(\b[A-Z]\).\(\1\).g'` Prints first character in each word in brackets