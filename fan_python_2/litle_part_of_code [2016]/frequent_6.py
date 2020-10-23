def find_most_frequent(text):
    
    text = text.lower()
    err = ',.:;!?- '
    FlagNoSpace = True
    newtext = ''
    d = {}
    
    for singl in err:
        text = text.replace(singl, ' ')
        
    if text == '':
        return []
        
    while text[len(text) - 1] == ' ':
        text = text[:len(text) - 1]
    while text[0] == ' ':
        text = text[1:]
        
    for letter in text:
        if FlagNoSpace:
            newtext = newtext + letter
        elif letter != ' ':
            newtext = newtext + letter
            FlagNoSpace = True
        if letter == ' ':
            FlagNoSpace = False
        
    listln = newtext.split(' ')
    
    for word in listln:
        counter = 0
        for j in range(len(listln)):
            if word == listln[j]:
                counter = counter + 1
        d[word] = counter

    maximum = max(d.values())

    final_list = []

    for key in d:
        if d[key] == maximum:
            final_list.append(key)
            
    final_list = sorted(final_list)
    
    return final_list

print(find_most_frequent(''))
