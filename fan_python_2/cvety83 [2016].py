def bouquets(narcissus_price, tulip_price, rose_price, limit):
    fp1 = narcissus_price
    fp2 = tulip_price
    fp3 = rose_price
    counter = 0
    

    for f1 in range(1+int(1.0 * limit / fp1)):
        for f2 in range(1+int((1.0 * limit - f1*fp1) / fp2)):
            for f3 in range(1+int((1.0 * limit - f1*fp1 - f2*fp2) / fp3)):
                if (f1+f2+f3) % 2:
                    counter += 1
    return counter
