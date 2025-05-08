
# import random
# import secrets


# print("Peddireddy Hari Vardhan Reddy")

# name = "hari"

# # hari 
# # arhi
# # hira



# # 2^4 = 16
# # [4][3][2][1] = 24

# def allName(inp)->any:
#     length = len(inp) #int
#     first = inp[0] 
#     rem = inp[1:]
#     for i in range(length):
#         rem = inp[i:]


# allName(name)

def Decorate():
    print("before decorator")
    callDecorator()
    print("after decorator")


@Decorate
def callDecorator():
    print("calling")
