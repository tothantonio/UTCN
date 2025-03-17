%Exercitiul 3

t = 0:0.1:10;

subplot(2, 3, 1)
plot(t, exp(-t))
subplot(2, 3, 2)
plot(t, 1/2 * sin(2*t))
subplot(2, 3, 3)
plot(t, exp(t))
subplot(2, 3, 4)
plot(t, -1/4 * exp(-2 * t))
subplot(2, 3, 5)
plot(t, 1/2 * exp(-2 * t) .* sin(2*t))
subplot(2, 3, 6)
plot(t, exp(2 * t) .* sin(2*t))

