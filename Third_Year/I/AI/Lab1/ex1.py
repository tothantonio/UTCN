list = [1, 2, -3, 4, -5, 6]
mean = sum(list) / len(list)
# print(mean)

pos = [n for n in list if n > 0]
neg = [n for n in list if n < 0]

# print(pos)
# print(neg)

# print(sum(list[:-2]))

odd = list[1::2]
# print(odd)

minim = list[0]
for n in range(1, len(list)):
    if list[n] < minim:
        minim = list[n]

print(minim)