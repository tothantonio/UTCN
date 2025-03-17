z1 = 3+4i;
z2 = -1-i;
z3 = (i-2)/(2i+1);
z4 = 1 / (i+1);

real(z1);
imag(z1);
real(z2);
imag(z2);
real(z3);
imag(z3);
real(z4);
imag(z4);

abs(z1);
abs(z2);
abs(z3);
abs(z4);

angle(z1);
angle(z2);
angle(z3);
angle(z4);

figure
hold on; grid on;
plot(real(z1), imag(z1), 'ro');
plot(real(z2), imag(z2), 'bo');
plot(real(z3), imag(z3), 'go');
plot(real(z4), imag(z4), 'mo');


