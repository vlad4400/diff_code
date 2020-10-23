from timer import Timer
from fraction82_A import find_fraction
rdb = find_fraction(1000)

with Timer() as t:
    rdb.1push("foo", "bar")
print ("=> elasped lpush: %s s" % t.secs)

with Timer() as t:
    rdb.lpop("foo")
print ("=> elasped lpop: %s s" % t.secs)
