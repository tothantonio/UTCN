# shopSmart.py
# ------------
# Licensing Information:  You are free to use or extend these projects for
# educational purposes provided that (1) you do not distribute or publish
# solutions, (2) you retain this notice, and (3) you provide clear
# attribution to UC Berkeley, including a link to http://ai.berkeley.edu.
# 
# Attribution Information: The Pacman AI projects were developed at UC Berkeley.
# The core projects and autograders were primarily created by John DeNero
# (denero@cs.berkeley.edu) and Dan Klein (klein@cs.berkeley.edu).
# Student side autograding was added by Brad Miller, Nick Hay, and
# Pieter Abbeel (pabbeel@cs.berkeley.edu).


"""
Here's the intended output of this script, once you fill it in:

Welcome to shop1 fruit shop
Welcome to shop2 fruit shop
For orders:  [('apples', 1.0), ('oranges', 3.0)] best shop is shop1
For orders:  [('apples', 3.0)] best shop is shop2
"""
from __future__ import print_function
import shop


def shopSmart(orderList, fruitShops):
    """
        orderList: List of (fruit, numPound) tuples
        fruitShops: List of FruitShops
    """
    "*** YOUR CODE HERE ***"
    minCost = -1
    bestShop = fruitShops[0]
    for shop in fruitShops[1:]:
        cost = shop.getPriceOfOrder(orderList)
        if cost < minCost:
            minCost = cost
            bestShop = shop

    return bestShop


if __name__ == '__main__':
    "This code runs when you invoke the script from the command line"
    orders = [('apples', 10.0), ('oranges', 3.0), ('bananas', 5.0), ('carrots', 5.0)]

    dir1 = {'apples': 10.0, 'oranges': 1.0, 'bananas': 10.0, 'carrots': 3.0}
    shop1 = shop.FruitShop('shop1', dir1)
    print(shop1)

    dir2 = {'apples': 1.0, 'oranges': 3.0, 'bananas': 5.0, 'carrots': 1.0}
    shop2 = shop.FruitShop('shop2', dir2)
    print(shop2)
    shops = [shop1, shop2]

    print("For orders ", orders, ", the best shop is", shopSmart(orders, shops).getName())
    orders = [('apples', 1.0)]
    print("For orders: ", orders, ", the best shop is", shopSmart(orders, shops).getName())

    print("Sold Fruits in", shop1.getName() + ":")
    print(shop1.getSoldFruits())
    print("Sold Fruits in", shop2.getName() + ":")
    print(shop2.getSoldFruits())

    print("Shops are equal?");
    print(shop1.__eq__(shop2))
