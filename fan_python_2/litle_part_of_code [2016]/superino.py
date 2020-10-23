def super_fibonacci(n, m):
    num = 0
    if n <= m:
        return 1
    for i in range(1, m + 1):
        num = num + super_fibonacci(n - i, m)

    return num
