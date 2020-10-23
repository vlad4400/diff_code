def encode_morze(text):
    morse_code = {
    "A" : ".-", 
    "B" : "-...", 
    "C" : "-.-.", 
    "D" : "-..", 
    "E" : ".", 
    "F" : "..-.", 
    "G" : "--.", 
    "H" : "....", 
    "I" : "..", 
    "J" : ".---", 
    "K" : "-.-", 
    "L" : ".-..", 
    "M" : "--", 
    "N" : "-.", 
    "O" : "---", 
    "P" : ".--.", 
    "Q" : "--.-", 
    "R" : ".-.", 
    "S" : "...", 
    "T" : "-", 
    "U" : "..-", 
    "V" : "...-", 
    "W" : ".--", 
    "X" : "-..-", 
    "Y" : "-.--", 
    "Z" : "--.."
    }
    s = ''
    sing = False
    FlagBegin = False
    text = text.upper()
    for letter in text:
        values = morse_code.get(letter)
        if values != None:
            if FlagBegin:
                s = s + '___'
            for value in values:
                if sing:
                    s = s + '_'
                if value == '.':
                    s = s + '^'
                else:
                    s = s + '^^^'
                sing = True
        elif letter == ' ':
            s = s + '____'
        FlagBegin = True
        sing = False
    return s

print(encode_morze('SOS'))
