a = [1, 10, 9, 10, 8]
b = [8, 10, 9, 10, 6]

triplets_a = [a[i:i+3] for i in range(len(a) - 2)]
triplets_b = [b[i:i+3] for i in range(len(b) - 2)]

res = any(triplet in triplets_a for triplet in triplets_b)
print(res)