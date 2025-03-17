clear

A = [0 1; -9.8 -1];
B = [0; 2];
C = [1 0];
D = 0;
sys = ss(A, B, C, D);
figure, impulse(sys);
figure, step(sys);