def convert_n_to_m(x, n, m, FlagFirst = True):

    if n == m:
        if type(x) == int or type(x) == str or type(x) == long:
            return str(x)
    if type(x) == int:
        if x < 0:
            return False
    if type(x) == str or type(x) == int or type(x) == long:
        x = str(x)
    else:
        return False
    
    while (x[0] == '0') and len(x) > 1:
        x = x[1:]
    x = x.upper()
    alpabook = {
        '0' : 0,
        '1' : 1,
        '2' : 2,
        '3' : 3,
        '4' : 4,
        '5' : 5,
        '6' : 6,
        '7' : 7,
        '8' : 8,
        '9' : 9,
        'A' : 10,
        'B' : 11,
        'C' : 12,
        'D' : 13, 
        "E" : 14,
        "F" : 15, 
        "G" : 16,
        "H" : 17,
        "I" : 18,
        "J" : 19,
        "K" : 20,
        "L" : 21,
        "M" : 22,
        "N" : 23,
        "O" : 24,
        "P" : 25,
        "Q" : 26, 
        "R" : 27, 
        "S" : 28,
        "T" : 29, 
        "U" : 30,
        "V" : 31,
        "W" : 32,
        "X" : 33,
        "Y" : 34,
        "Z" : 35
        }
    roll = []
    
    for char in x:
        roll.append(alpabook[char])

    def convert_to_dd(roll, n):
        p = 0
        for j in range(len(roll)):
            p = p + roll[j] * n ** (len(roll) - j - 1)
        return p
            
    def convert_with_dd(p, m):
        t = []
        
        if m == 1:
            for j in range(p):
                t.append(0)
            return t
            
        while p >= m:
            t.append(p % m)
            p = p // m
        t.append(p % m)
        t.reverse()
        return t

    s = convert_to_dd(roll, n)
    s = convert_with_dd(s, m)
        
    fan = ''
    for value in s:
        for key in alpabook.keys():
            if value == alpabook[key]:
                fan = fan + key

    if FlagFirst:
        FNZ = False
        for j in fan:
            if j != '0':
                FNZ = True
            if FNZ:
                if convert_n_to_m(fan, m, n, False) != x:
                    return False
    
    return fan

import sys
print(0, convert_n_to_m('FF', 16, 10))
print(1, convert_n_to_m([123], 4, 3))
print(2, convert_n_to_m("0123", 5, 6))
print(3, convert_n_to_m("123", 3, 5))
print(4, convert_n_to_m(123, 4, 1))
print(5, convert_n_to_m(-123.0, 11, 16))
print(6, convert_n_to_m("A1Z", 36, 16))
print(7, convert_n_to_m([1], 2, 2))
print(8, convert_n_to_m(123123123123123123123, 11, 16))
print(9, convert_n_to_m([1], 2, 2))
print(10, convert_n_to_m(123123123123123123123, 10, 10))
print(11, convert_n_to_m(123123123123123123123, 11, 16))
print(12, convert_n_to_m(sys.argv[1], 10, 2))
