def find_fraction(summ):
    denominator = summ // 2 + 1
    numerator = summ - denominator
    n = numerator
    FlagFraction = True
    for j in range(n): #chainges of the fractions
        for i in range(2, numerator // 2 + 1): #checks for correctness
            if denominator % i == 0:
                if numerator % i == 0:
                    FlagFraction = False
                    continue
        if FlagFraction:
            return (numerator, denominator)
        denominator = denominator + k
        numerator = numerator - k
    return False

import time
t1 = time.time()
print(find_fraction(10000000))
print(time.time() - t1)
