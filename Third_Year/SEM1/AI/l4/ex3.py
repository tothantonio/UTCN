a = [1, 10, 9, 10, 8] 
b = [8, 10, 9, 7, 6] 

triplets_a = [a[i:i+3] for i in range(len(a) - 2)]
triplets_a = [b[i:i+3] for i in range(len(b) - 2)]

ok = 0
for i in range(len(a) - 2):
    for j in range(len(b) - 2):
        if a[i] == b[j]:
            if a[i+1] == b[i+1]:
                if a[i+2] == b[i+2]:
                    ok = 1;
                    print("True")
if ok == 0:
    print("False")






