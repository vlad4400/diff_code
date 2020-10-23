class Sphere(object):
    def __init__(self, r = 1, x = 0.0, y = 0.0, z = 0.0):
        self.r = r
        self.x = x
        self.y = y
        self.z = z

    def get_volume(self):
        import math
        return 4.0/3.0 * math.pi * self.r ** 3

    def get_square(self):
        import math
        return 4 * math.pi * self.r ** 2

    def get_radius(self):
        return self.r
    
    def get_center(self):
        return (self.x, self.y, self.z)

    def set_radius(self, radius):
        self.r = radius

    def set_center(self, x, y, z):
        self.x = x
        self.y = y
        self.z = z

    def is_point_inside(self, a, b, c):
        import math
        point = math.sqrt((self.x - a)**2 + (self.y - b)**2 + (self.z - c)**2)
        if self.r > point:
            return True
        return False

s = Sphere()
print(s.get_volume())
print(s.get_square())
print(s.get_radius())
print(s.get_center())
print(s.is_point_inside(3, 2, 3))
s.set_radius(5)
s.set_center(3, 5, 6)
print(s.get_volume())
print(s.get_square())
print(s.get_radius())
print(s.get_center())
print(s.is_point_inside(3, 2, 3))
