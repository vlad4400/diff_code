def file_search(folder, filename):
    track = folder[0] + '/'
    if filename in folder[1:]:
        print(0)
        return track + filename
    else:
        for count in folder[1:]:
            print(8)
            if type(count) == list and len(count) > 1:
                track = track + file_search(count, filename)
                print(7)
                #track = track + trink
                print(5)
                return track
                print(4)
            print(3)
        print(2)
    print(1)
    '''
    if track == track:
        print(21)
        return False
    else:
        print(22)
        return track
    '''
