function fib = fibonacci(n)
% FIBONACCI Generează primele n numere din șirul lui Fibonacci
% Input:
%   n - numărul de elemente din șir
% Output:
%   fib - vector cu primele n numere din șirul Fibonacci

% Verificare input
if n <= 0
    error('Numărul de elemente trebuie să fie pozitiv');
end

% Inițializare vector
fib = zeros(1, n);

% Conform definiției, primele două numere din șir sunt 1
if n >= 1
    fib(1) = 1;
end
if n >= 2
    fib(2) = 1;
end

% Generare restul elementelor
for i = 3:n
    fib(i) = fib(i-1) + fib(i-2);
end
end