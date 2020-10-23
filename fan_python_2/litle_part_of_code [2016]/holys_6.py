def count_holes(n):
    try:
        FlagError = False
        if '.' in str(n):
            if count == '.':
                FlagError = True
        n = int(n)
        n = str(n)
        k1 = '0469'
        s = 0
        for count in n:
            if count in k1:
                s = s + 1
            if count == '8':
                s = s + 2
        if FlagError:
            s = 'ERROR'
        return s
    except:
        return 'ERROR'

print(count_holes(54))
