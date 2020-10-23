import sys

sum = 0
a = int(sys.argv[1])
b = int(sys.argv[2])

for cn in range(a, b + 1):
    ss = '0' * (6 - len(str(cn))) + str(cn)
    if  int(ss[0]) + int(ss[1]) + int(ss[2]) == int(ss[3]) + int(ss[4]) + int(ss[5]):
        sum = sum + 1

print(sum)
