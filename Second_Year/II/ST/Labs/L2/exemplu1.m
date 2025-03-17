H=tf(1, [1 3 2])
figure(1)
[yi_sim, ti] = impulse(H, 10); 
yi_calc = exp(-ti) - exp(-2*ti);
plot(ti, yi_sim, ti, yi_calc, '*')
figure(2)
[ys_sim, ts] = step(H, 10);
ys_calc = 0.5 - exp(-ts) + 0.5*exp(-2*ts);
plot(ts, ys_sim, ts, ys_calc, '*')
