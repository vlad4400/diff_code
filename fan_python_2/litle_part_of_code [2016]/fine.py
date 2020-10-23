def file_search(folder, filename):
    track = folder[0] + '/'
    if filename in folder[1:]:
        return track + filename
    else:
        for count in folder[1:]:
            if type(count) == list and len(count) > 1:
                track = track + file_search(count, filename)
                return track
    return False
