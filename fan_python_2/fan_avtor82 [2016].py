def find_fraction(summ):
    def is_ok(top, bottom):
        if top >= bottom or (bottom % top == 0 and top != 1):
            return False
        for i in range(2, int(top**0.5)):
            if top % i == 0 and bottom % i == 0:
                return False
        return True

    top = summ / 2
    bottom = summ - top
    while top > 0 and not is_ok(top, bottom):
        top -= 1
        bottom += 1
    if top > 0:
        return (top, bottom)
    else:
        return False

import time
t1 = time.time()
print(find_fraction(1000000000))
print(time.time() - t1)
