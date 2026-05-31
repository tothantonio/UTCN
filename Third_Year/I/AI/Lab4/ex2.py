def front3(s):
    if len(s) < 3:
        front = s
    front = s[:3]
    return 3*front


print(front3("Python"))