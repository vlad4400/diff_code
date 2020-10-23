def file_search(folder, filename):
    track = folder[0] + '/'
    vrank = ''
    for count in folder[1:]:
        if type(count) == list:
                vrank = track + str(file_search(count, filename))
                print (track)
        else:
            if count == filename:
                vrank = count
                print (count)
    return vrank
    
