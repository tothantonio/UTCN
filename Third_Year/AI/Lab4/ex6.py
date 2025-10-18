class Complex:
    def __init__(self, a, b):
        self.a = a
        self.b = b

    def complex_add(self, other):
        return (self.a + other.a, self.b + other.b)

    def complex_sub(self, other):
        return (self.a - other.a, self.b - other.b)

    def complex_mul(self, other):
        return (self.a * other.a - self.b * other.b, self.a * other.b + self.b * other.a)

no1 = Complex(3, 2)
no2 = Complex(5, 6)

print(no1.complex_add(no2))
print(no1.complex_sub(no2))
print(no1.complex_mul(no2))