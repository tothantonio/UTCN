import math
from scipy.special import softmax as special_softmax

def softmax(x):
    exp_x = [math.exp(val) for val in x]

    result = [exp_val / sum(exp_x) for exp_val in exp_x]
    return result

def main():
    a = [-0.4, 0, 0.2, 0.2, 0.4]
    print(softmax(a))
    print("Cu scipy:")
    print(special_softmax(a))

if __name__ == '__main__':
    main()
