def make_sudoku(size):
    s = []
    for i in range(size):
        s.append(range(i * size + 1, size**2 + 1))
        s[i].extend(range(1, i * size +1))
    for i in range(size, size**2):
        s.append([])
        for j in range(size**2):
            s[i].append(0)
    for i in range(1,size):
        for j in range(0,size):
            for ii in range(0, size**2):
                s[i*size + j][ii] = s[(i-1)*size + j][(ii+1)%(size**2)]

    return s
