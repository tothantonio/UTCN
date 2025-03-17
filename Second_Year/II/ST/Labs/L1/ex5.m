%Exercitiul 5
for a = 0:0.01:sqrt(2)/2
    plot(abs(roots([1, -2*a, 2 * a * a])), '*')
    hold on
end

for a = 0:0.01:1
    plot(abs(roots([1, -a, a * a])), '*')
    hold on
end