def counter(a, b):

    a = str(a)
    b = str(b)
    
    def clean_similar(s):
        list = ''
        for count in range(len(s)):
            FNE = True
            for i in range(count):
                if s[count] == s[i]:
                    FNE = False
            if FNE:
                list = list + s[count]
        return list

    a = clean_similar(a)
    b = clean_similar(b)

    coun = 0
    
    for letter_1 in a:
        for letter_2 in b:
            if letter_1 == letter_2:
                coun = coun + 1

    return coun
