import sys, math


f = 'la' + (int(sys.argv[1]) - 1) * '-la'
f = int(sys.argv[2]) * (' ' + f)

pref_1 = int(sys.argv[3]) * '!'
pref_2 = (1 - int(sys.argv[3])) * '.'

f = 'Everybody sing a song:' + f + pref_1 + pref_2

print(f)
