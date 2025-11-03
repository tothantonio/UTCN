freq = {}

with open("file.txt", "r") as fin:
    data = fin.read();

words = data.split()

for word in words:
    if word in freq:
        freq[word] += 1
    else:
        freq[word] = 1

print(freq)
