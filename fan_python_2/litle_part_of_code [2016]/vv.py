import sys

n = int(sys.argv[1])
a = 0
b = 1
if n > 2:
    for count in range(n - 1):
        x = a + b
        a = b
        b = x
else:
    if n > 1:
        x = n - 1
    else:
        x = n
print(x)
