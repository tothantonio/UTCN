import math
class GeometricForm:
    def getArea(self):
        pass
    def getPerimeter(self):
        pass

class Rectangle(GeometricForm):
    def __init__(self, width, height):
        self.width = width
        self.height = height

    def getArea(self):
        return self.width * self.height
    def getPerimeter(self):
        return 2 * (self.width + self.height)

class Circle(GeometricForm):
    def __init__(self, radius):
        self.radius = radius

    def getArea(self):
        return math.pi * (self.radius ** 2)
    def getPerimeter(self):
        return 2 * math.pi * self.radius

r = Rectangle(10, 10)
print(r.getArea())
print(r.getPerimeter())