import math

def softmax(x):
    exp_x = [math.exp(i) for i in x]
    return [exp_val / sum(exp_x) for exp_val in exp_x]

print(softmax([-0.4, 0, 0.2, 0.2, 0.4]))
