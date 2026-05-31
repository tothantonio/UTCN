# 1. list comprehension
# 2. citire + scriere fisier
    # string1,
    # string2,
    # ....
    
    # + ceva conditie, parsare string
# 3. 2 dictionare/1 dictionar si 1 set
   # - faci ceva cu datele
# 4. for si un if/else
   # o problema de logica
   # ni se dau cv functii
   # o prb din lab dar mai complexa
# 5. faci o clasa, 2/3 functii si faci ceva
   # run-ul e facut, eu fac doar clasa si metodele
   

def front3(s):
    if len(s) < 3:
        return s
    return s[:3]*3

print(front3("Python"))