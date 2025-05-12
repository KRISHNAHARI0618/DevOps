## Find Commands 

- *Find [filepath] [expression]*
- `find .` Find all files in current directory
- `find /path -name "*.log"` find files with specific extension
- `find /path -iname "*.jpg` find files by ignoring specific extension
- `find /path -mtime -2` find files modified in last 2 days
- `find /path -mtime +10` find files modified morethan 10 Days
- `find /path -size +100M` Files larger than 100MB
- `find /path -size -1k` files less than 1 kb
- `find /path -type f -perm /111 -exec chmod -x {} \;` find and replace execute permissions. 
- `find /tmp -name "*.tmp" -mtime +7 -exec rm -f {} \;` find the temporary fields and delete
- `find /path -type f -name "*.log" -mtime +10 -exec gzip {} \; -exec mv -r {}.gz $dir` find and move to arrchieve directory