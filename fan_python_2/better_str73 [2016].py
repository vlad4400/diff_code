class SuperStr(str):

    def __init__(self, value):
        self.value = value
    
    def is_repeatance(self, same_str):
        if type(same_str) != str or same_str == '' or same_str > self.value:
            return False
        FlagRepeating = True
        same_str = same_str * (len(self.value) // len(same_str))
        if same_str == self.value:
            return True
        return False

    def is_palindrom(self):
        same_str = self.value.upper()
        new_str = ''
        for letter in same_str:
            new_str = letter + new_str
        if same_str == new_str:
            return True
        return False

s = SuperStr('123123123123')
print(s.is_repeatance('123')) # True
print(s.is_repeatance('123123')) # True
print(s.is_repeatance('123123123123')) # True
print(s.is_repeatance('12312')) # False
print(s.is_repeatance(123)) # False
print(s.is_palindrom()) # False
print(s) # 123123123123 (рядок)
print(int(s)) # 123123123123 (ціле число)
print(s + 'qwe') # 123123123123qwe
p = SuperStr('123_321')
print(p.is_palindrom()) # True
