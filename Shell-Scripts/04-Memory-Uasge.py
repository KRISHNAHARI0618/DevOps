import psutil
import sys
import os

threashold = 10
usage = psutil.disk_usage(os.getcwd())
usage_percent = usage.percent

if usage_percent > threashold:
    print("Send EMail Alerts ...")
else:
    print("Dont Send email alert")

print(usage.percent)

print(os.listvolumes())

print("All is Well")

print(os.getcwd())
print(psutil.disk_usage("/"))
print(psutil.cpu_percent())
print(psutil.cpu_stats())