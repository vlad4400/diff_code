class Student(object):
    def __init__(self, name, conf):
        self.name = name
        self.conf = conf
        self.list_lab = []
        for j in range(conf['lab_num']):
            self.list_lab.append(0)
        self.exam = 0

    def make_lab(self, m, n = None):
        if n == None:
            for j in range(len(self.list_lab)):
                if self.list_lab[j] == 0:
                    n = j
                    break
                if j == len(self.list_lab) - 1:
                    return self
        if m <= self.conf['lab_max'] and n < self.conf['lab_num']:
            self.list_lab[n] = m
        elif n < self.conf['lab_num']:
            self.list_lab[n] = self.conf['lab_max']
        #print(self.list_lab, n)
        return self
        
    def make_exam(self,m):
        if m <= self.conf['exam_max']:
            self.exam = m
        else:
            self.exam = self.conf['exam_max']
        return self

    def is_certified(self):
        t = 0
        for lab in self.list_lab:
            t = t + lab
        t = t + self.exam
        if t >= self.conf['k'] * 100:
            k = True
        else:
            k = False
        t = (t,k)
        return t

conf = {
'exam_max': 30,
'lab_max': 7,
'lab_num': 10,
'k': 0.61,
}
'''
oleg = Student('Oleg', conf)
oleg.make_lab(5,6).make_lab(4).make_lab(5,3)
oleg.make_exam(28)
print(oleg.is_certified())

oleg.make_lab(7,1).make_lab(3,8).make_lab(8,4).make_lab(4)\
.make_lab(6,2).make_lab(7,5).make_lab(7,4).make_lab(7,7)\
.make_lab(7,9)
print(oleg.is_certified())
'''
conf2 = {'exam_max': 52,'lab_max': 8,'lab_num': 6,'k': 0.5}
o5 = Student('Oleg', conf2)
'''
oleg.make_lab(1) \
.make_lab(8,0) \
.make_lab(1) \
.make_lab(10,7) \
.make_lab(4,1) \
.make_lab(5) \
.make_lab(6.5) \
.make_exam(32)
oleg.make_lab(50,2)
print(oleg.is_certified())
oleg.make_lab(7,1)
'''
o5.make_lab(40).make_lab(7,5).make_lab(1).make_lab(7).make_lab(7).make_lab(7).make_lab(7,1)
print(o5.is_certified())
