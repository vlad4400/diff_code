import sys

key = 'aaaaabbbbbabbbaabbababbaaababaab'
alphabet = 'abcdefghijklmnopqrstuvwxyz'

st = ''
sst = ''
lt = []
pt = []
k = 0
fing = ''

for count in range(1, len(sys.argv)):
    st = st + sys.argv[count]

for count in st:
    if alphabet.find(count) > -1:
        sst = sst + 'a'
    else:
        sst = sst + 'b'

for count in range(0, len(st) // 5):
    pt.append(sst[k:5 + k])
    k = k + 5

for count in pt:
    fing = fing + alphabet[key.find(count)]

print(sys.argv)
print(st)
print(sst)
print(pt)
fin = fing[:len(fing) % 5]
print(fin)
print(fing)
