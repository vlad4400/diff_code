def find_fraction(summ):

  def nod(a,b):
    while a!=0 and b!=0:
      if a > b:
        a = a % b
      else:
        b = b % a
    return (a+b)

  half = 1.0 *summ / 2
  drobnaya_half = half - int(half)
  if drobnaya_half == 0:
    chislitel = int(half - 1)
    znamenatel = int(half + 1)
  else:
    chislitel = int(half - drobnaya_half)
    znamenatel = int(half + drobnaya_half)
  counter = 1
  while chislitel != 0:
    if nod(chislitel, znamenatel) != 1:
      chislitel = chislitel - counter
      znamenatel = znamenatel + counter
      counter = counter + 1
    else:
      return (chislitel, znamenatel)
  if chislitel == 0:
    return False

import time
t1 = time.time()
print(find_fraction(1000000000))
print(time.time() - t1)
