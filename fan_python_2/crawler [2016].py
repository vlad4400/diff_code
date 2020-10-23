from maze_runner import *

def maze_controller(r):

    from random import randint, randrange
    
    front = False
    left = False
    behind = False
    right = False
    nap_const = [front, left, behind, right]

    def check_moves(): #determine the available moves
        for nap in range(len(nap_const)):
            if r.go():
                r.turn_left().turn_left()
                r.go()
                nap_const[nap] = True
                r.turn_left().turn_left()
            else:
                nap_const[nap] = False
            r.turn_left()

    def set_direction(events):
        if events == 2:
            n = 0
            while n > -1:
                n = randint(0,3)
                if n == 0 and nap_const[0]:
                    return
                if n == 1 and nap_const[1]:
                    r.turn_left()
                    return None
                if n == 2 and nap_const[2]:
                    return None
                if n == 3 and nap_const[3]:
                    r.turn_right()
                    return None
        if events == 1:
            if nap_const[1]:
                r.turn_left()
                return None
            if nap_const[2]:
                r.turn_right().turn_right()
                return None
            if nap_const[3]:
                r.turn_right()
        
    if r.found():
        return None
    
    check_moves()
    summ = int(nap_const[0]) + int(nap_const[1]) + int(nap_const[2]) + int(nap_const[3])
    if summ == 1 or summ == 2:
        set_direction(1)
        r.go()
        check_moves()
    if r.found():
        return None
    
    for j in range(100000):
        summ = int(nap_const[0]) + int(nap_const[1]) + int(nap_const[2]) + int(nap_const[3])
        if summ == 1:
            set_direction(1)
            r.go()
        if summ == 2 or summ == 3 or summ == 4:
            set_direction(2)
            r.go()
        if r.found():
            print(j)
            return None
        check_moves()


maze_example5 = {
    'm': [
        [0,0,0,1,1,0,1,1,0,0,0],
        [0,1,0,0,0,0,0,0,0,1,0],
        [0,1,0,1,1,1,1,1,0,1,0],
        [0,0,0,1,0,0,0,1,0,0,0],
        [0,0,1,1,0,0,0,1,1,0,0],
        [0,0,1,0,0,0,0,0,1,0,0],
        [0,0,1,0,1,0,1,0,1,0,0],
        [0,0,1,0,0,0,0,0,1,0,0],
        [0,0,1,1,1,0,1,1,1,0,0],
        [0,0,0,0,0,0,0,0,0,0,0],
        [0,0,1,0,1,0,1,0,1,0,0],
    ],
    's': (0,5),
    'f': (4,5)
}
maze_runner = MazeRunner(maze_example5['m'], maze_example5['s'], maze_example5['f'])

maze_controller(maze_runner)
print('------')
print(maze_runner.found())
