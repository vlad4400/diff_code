import sys

key = 'aaaaabbbbbabbbaabbababbaaababaab'
alphabet = 'abcdefghijklmnopqrstuvwxyz'
stn = ''
ficha = ''
k = 0
numb = 0

string = sys.argv[1].replace(' ', '')

for count in string:
    if alphabet.find(count) > -1:
        stn = stn + 'a'
    else:
        stn = stn + 'b'
        
numb = len(stn) - len(stn) % 5

while k < numb:
    ficha = ficha + alphabet[key.find(stn[k:k + 5])]
    k = k + 5

print(ficha)
