from collections import Counter

freq = {}

with open("file1.txt", "r") as f:
    words = f.read().split()

for word in words:
    if word in freq:
        freq[word] += 1
    else:
        freq[word] = 1

print(freq)




