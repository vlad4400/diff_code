#This function that delete repeating elements

def clean_list(s):
    list = []
    for count in range(len(s)):
        FNE = True
        for i in range(count):
            a = s[count]
            b = s[i]
            if (a == b) and (type(a) == type(b)):
                FNE = False
        if FNE:
            list.append(s[count])
    return list
