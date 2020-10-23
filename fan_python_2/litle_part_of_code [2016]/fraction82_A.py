import time

def find_fraction(summ):
    denominator = summ // 2 + 1
    numerator = summ - denominator
    n = numerator
    for j in range(n): #chainges of the fractions
        FlagFraction = True
        for i in range(2, numerator // 2 + 1): #checks for correctness
            if denominator % i == 0 and numerator % i == 0:
                FlagFraction = False
        if FlagFraction:
            return (numerator, denominator)
        denominator = denominator + 1
        numerator = numerator - 1
    return False
t1 = time.time()
print(find_fraction(100000000))
print(time.time() - t1)
