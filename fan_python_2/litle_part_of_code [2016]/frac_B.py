def find_fraction(summ):

  for ii in range(summ//2):
    aa1,aa2=summ/2-ii,summ-summ/2+ii
    while aa2 != 0:
        aa1,aa2=aa2,aa1%aa2
        if aa1==1 and summ-aa1 != 1:
            return (summ/2-ii,summ-summ/2+ii)
  return False

import time
t1 = time.time()
print(find_fraction(10000000000000000))
print(time.time() - t1)
