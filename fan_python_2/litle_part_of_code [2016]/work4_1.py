import sys

a = []

stg = str(sys.argv[1]).upper()

for count in stg:
    if count != ' ':
        a.append(count)

b = list(a)
b.reverse()

if a == b:
    print("YES")
else:
    print("NO")


