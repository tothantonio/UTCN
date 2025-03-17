function fib = fibonacci(n)
    fib(1) = 1;
    fib(2) = 1;
for i = 3:n
    fib(i) = fib(i-1) + fib(i-2);
end
end