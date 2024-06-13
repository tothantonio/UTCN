AX = 5
BX = 13
DI = 2
a = 13
y = 4

def power(base, exponent):
    result = 1
    for _ in range(exponent):
        result *= base
    return result

sum_result = 0
for j in range(1, 20):
    sum_result += ((j * AX) / (power(a, y)) - (power(BX, DI))) / (20 + j)

print(f"The result is: {sum_result}")
