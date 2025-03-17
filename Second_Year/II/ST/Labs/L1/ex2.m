%Exercitiul 2
for k = 0:0.5:10
    p = [1 2 3 k];
    plot(real(roots(p)), imag(roots(p)), '*')
    hold on
    pause(0.1)
end