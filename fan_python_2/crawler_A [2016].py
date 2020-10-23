def maze_controller(r):
    
    bottom = False
    left = False
    top = False
    right = False
    nap_const = [bottom, left, top, right]

    def hm():
        for nap in range(len(nap_const)):
            if r.go():
                r.turn_left().turn_left()
                r.go()
                nap_const[nap] = True
                r.turn_left().turn_left()
            else:
                nap_const[nap] = False
            r.turn_left()

    def right_turn():
        #if nap_const[0] == True:
        if nap_const[1] == True:
            r.turn_left()
            return None
        #if nap_const[2] == True:
        if nap_const[3] == True:
            r.turn_right()
    
    if r.found():
        return None
    hm()
    for j in range(100):
        summ = nap_const[0] + nap_const[1] + nap_const[2] + nap_const[3]
        if summ == 1 or summ == 2:
            right_turn()
            r.go()
            hm()
        if r.found():
            return None
