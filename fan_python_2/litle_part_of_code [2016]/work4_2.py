import sys

a = sys.argv[1]

for count in sys.argv[2:-1]:
    a = count + ' ' + a

print(a)
