clear all

EMS = tf(-2, [10 0 -20000]);
EDS = tf(2, [10 0 20000]);

figure, impulse(EMS, 0.1), grid on;

figure, impulse (EDS, 1), grid on;


