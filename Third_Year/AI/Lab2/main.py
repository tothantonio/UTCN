def show_best_player(team, *players):
    print(f"Team {team} Best player: {players[1]}")

def ex1():
    price = {"apples":10, "milk":12, "bread":5}
    mylist = [("apples", 2), ("milk", 2)]

    total = sum(v * price.get(k) for k,v in mylist)
    print(total)

def ex2():
    friends = [("andrew", 10), ("george", 20), ("andrew", 5), ("ann", 10)]
    names = {name for name, _ in friends}
    print(names)

def ex3():
    n = int(input("Nr:"))
    if n % 2 == 0:
        print(list(range(n + 1)))
    else:
        print([i ** 2 for i in range(n + 1)])

def ex4():
    s_in = str(input("String:"))
    num_in = int(input("Number:"))

    result = {i: s_in[i % len(s_in)] for i in range(num_in)}
    print(result)

def ex5(chr):
    chr = (c + 1 for c in chr)
    print(chr)

def ex6():
    file1 = "file1.txt"
    file2 = "file2.txt"

    with open(file1, "r") as f1, open(file2, "r") as f2:
        data1 = f1.read()
        modified_data = data1.title()
        data2 = f2.read()

    with open(file2, "w") as f2:
        f2.write(data2 + "\n" + modified_data)

def main():
    ex6()

if __name__ == "__main__":
    main()
