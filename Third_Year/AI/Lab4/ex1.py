students = [
    ["Alice", 10],
    ["Bob", 9],
    ["Charlie", 8],
    ["David", 7],
    ["Eve", 8]
]

grades = sorted(set([item[1] for item in students]))
stud_list = [item[0] for item in students if item[1] == grades[1]]

print([name for name in stud_list])