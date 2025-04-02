Process Commands:

ps: display information about process
top: displays dynamic real-time information about the system process , memory usage and CPU Utilization
htop: extended version of top command with additional features
kill: PID terminate the process by sending the siganl
kill process_name: Terminate the proecess by name
killall process_name: terminate all process by name
pkill: sending a signal to a process or processes based on their name
pgrep: List the process id of processes based on their name
nohup: Run a Command immune to hangups with output to a non tty
jobs: display the status of jobs in the current shell session
bg: move a job to the background
fg: move a job to the foreground
nice: set the priority of process
pstree: display the process of diagram
lsof: list open files associated with active processes
strace: Trace System calls and signals for running processes
journalctl: Query and displaying messages from the journal a centralized logging system
uptime:

Memory Commands:

free -h : information about the systems free and used memory including the swao space
vmstat: virtual memory statistics
pmap: display the memmory map of a process showing the memory  segments used by the process
rsync: remote synchronize cached writes to persistent storage ensuring data consistency
sync: synchronize cahched writes to persistent stoarge ensuring data consistency
swapon: enable a swap device or file
swapoff: disable a swap device or file
MemAvailable: Available memory in the system
MemFree: after utilizing the memory the freed memory in the system

Open Port 80 in the firewall:
ufw:
  rule: allow
  port: 80






