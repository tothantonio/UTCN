price = {"apples" : 10, "milk" : 12, "bread" : 5}
mylist = [("apples", 2), ("milk", 2)]
# print(sum(price[item[0]] * item[1] for item in mylist))

friends = [("andrew", 10), ("george", 20), ("andrew", 5), ("ann", 10)]
empty_set = set()
empty_set.update(item[0] for item in friends)
# print(empty_set)

number = int(input("Enter a number:"))

if number % 2 == 0:
    print([x for x in range(number)])
elif number % 2 == 1:
    print([x*x for x in range(number)])