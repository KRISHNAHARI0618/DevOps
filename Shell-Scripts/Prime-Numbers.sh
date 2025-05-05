echo "Please Enter a number:"
read number

if [ $number -lt 0 ]; then
    echo "Please enter a positive number."
else
    for (( i=2; i<=$number; i++ ))
    do
        is_prime=1
        for (( j=2; j*j<=i; j++ ))
        do
            if [ $((i % j)) -eq 0 ]; then
                is_prime=0
                break
            fi
        done
        if [ $is_prime -eq 1 ]; then
            echo "$i is a prime number."
        fi
    done
fi
echo "All prime numbers up to $number have been displayed."

# Prime Numbers or not
# 1) Prime number is a number which is only divisible by 1 and itself 

for (( i=2; i<=100; i++ ))
do
    is_prime=1
    for (( j=2; j*j<=i; j++ ))
    do
        if [ $((i % j)) -eq 0 ]; then
            is_prime=0
            break
        fi
    done
    if [ $is_prime -eq 1 ]; then
        echo "$i is a prime number."
    fi
done