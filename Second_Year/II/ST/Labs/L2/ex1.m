
syms t
c = 2 - 3 * exp(-t) + 3 * exp(-2 * t) * cos(2 * t);
laplace(c) / laplace(exp(-t))
