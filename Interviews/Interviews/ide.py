a = [1,2,3]
a =tuple(a)
# a[0] = 2
print(a)

name1 = 'geeksforgeeks'
name = set(name1)
name = "".join(name)
print(name)
dup = " "
for i in name1:
  if i in dup:
    pass
  else:
    dup = dup + i
    print(dup)

new_list = ["Python", "welcome", "hello", "programming", "sorting", "zebra", "alligator"]
sort_newList = sorted(new_list)
print(sort_newList)

