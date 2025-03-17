function grafic(G)

figure, impulse(G, 10), grid on;
hold on;
step(G, 10), grid on;
hold off;

end