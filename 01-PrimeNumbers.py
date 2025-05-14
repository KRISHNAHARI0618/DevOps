print("Printing Prime Numbers .. ")

number = 10
PrimeNumbers = []
NonPrimeNumbers = []
for i in range(2,number+1):
    for j in range(2,i):
        if i % j == 0:
            break
    else:
        NonPrimeNumbers.append(i)
print(NonPrimeNumbers)