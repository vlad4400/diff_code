import sys

FlagError = True
sum = 0

for count in sys.argv[1]:
    if count == '(':
        sum = sum + 1
    else:
        sum = sum - 1
    if sum < 0:
        FlagError = False

if FlagError and sum == 0:
    print('YES')
else:
    print('NO')

