def saddle_point(matrix):
    for lt in matrix:
        FlagMin = True
        j = 0
        mn = lt.index(min(lt))
        for i in lt:
            if lt[mn] == i:
                j = j + 1
            if j > 1:
                FlagMin = False
        for i in matrix:
            if lt[mn] < i[mn]:
                FlagMin = False
            if matrix.index(lt) != matrix.index(i) and lt[mn] == i[mn]:
                FlagMin = False
        if FlagMin:
            tr = (matrix.index(lt), mn)
            return tr
    return False
    
print(saddle_point([[8,3,0,1,2,3,4,8,1,2,3],[3,2,1,2,3,9,4,7,9,2,3],[7,6,0,1,3,5,2,3,4,1,1]]));
