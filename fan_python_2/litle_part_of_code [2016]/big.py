import sys

a = float(sys.argv[1])
b = float(sys.argv[2])
c = float(sys.argv[3])

sum = (a + b + c) / 2
if sum > a and sum > b and sum > c:
    print('triangle')
else:
    print('not triangle')
    

