from genericpath import isdir
import os 


list1=["apple","banana","orange","banana"]

newset = set(list1)
print(newset)

for i in range(len(list1)):
    print(i)
    if list1[i] == "orange":
        list1[i] = "mongo"

print(list1)

directory = "."

print(os.getcwd())

for list in os.listdir():
    if os.path.isfile(list):
        print(f"This is File {list}")
    elif os.path.isdir(list):
        print(f"This is Directory {list}")
    else:
        print(f"This is Others {list}")


"""Meeting link
https://verizon.webex.com/verizon/j.php?MTID=mb053664757f8f0eaf846c12911e3761c

Meeting number
2868 633 5350

Video address
28686335350@verizon.webex.com

Audio connection
US San Antonio Toll +1-210-795-0492
US Toll Free +1-800-365-8460

Access code
2868 633 5350
"""