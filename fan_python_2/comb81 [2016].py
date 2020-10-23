class CombStr:

    def __init__(self, string):
        self.string = string

    def count_substrings(self, length):
        if length == 0:
            return 0
        m = []
        for j in range(len(self.string) - length + 1):
            a = self.string[j:j + length]
            FNP = True
            for i in range(len(m)):
                b = m[i]
                if b == a:
                    FNP = False
            if FNP:
                m.append(a)
        return len(m)


#Sata = CombStr('vvvvttrrrrtttttrrr')
#print(Sata.count_substrings(4))

s0 = CombStr('qqqqqqweqqq%')
print(s0.count_substrings(0)) # 0
print(s0.count_substrings(1)) # 4
print(s0.count_substrings(2)) # 5
print(s0.count_substrings(5)) # 7
print(s0.count_substrings(15)) # 0
