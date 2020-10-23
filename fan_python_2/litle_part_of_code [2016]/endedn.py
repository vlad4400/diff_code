def file_search(folder, filename):
    path = str(folder[0]) + '/'
    if filename in folder[1:]:
        return path + filename
    else:
        for item in folder[1:]:
            if type(item) is list and len(item)> 1:
                src = file_search(item, filename)
                if src != False:
                    path = path + str(src)
                return path
    if path == path:
        return False
    else:
        return path
