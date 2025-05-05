for i in range(1,100):
    if i > 1:  # Check if the number is greater than 1
        for j in range(2, i):  # Check for factors from 2 to i-1
            if (i % j) == 0:  # If i is divisible by j, it's not prime
                break
        else:  # If no factors were found, it's prime
            print(i)
        
for i in range(-100,100):
    if i < 0:
        
    for j in range(2,i):
        if i%j == 0:
            break
    else:
        print(i)