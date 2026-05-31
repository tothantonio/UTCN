students = [
    ["Laurentiu", 10],
    ["John", 7],
    ["Ionut", 8]
]

## print(students)

grade = sorted(item[1] for item in students)

## print(grade)

names = [item for item in students if item[1] == grade[1]]

print(names)