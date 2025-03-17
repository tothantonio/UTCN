%Exercitiul 4
function plotfreq(n)
    t = 0:0.1:10;

    f1 = exp(-t);
    f2 = sin(2*pi*n*t);
    f3 = f1 .* f2;

    plot(t, f1), hold on
    plot(t, f2)
    plot(t, f3)
end
