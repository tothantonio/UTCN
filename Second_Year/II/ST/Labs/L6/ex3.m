G=tf(5, conv([0.5,1],conv([1,1],[10,1])));
Gc=1;
G0=feedback(Gc*G, 1);
pole(G0);

Gc2 = tf([1,0.071],[1,0.0071])
G02 = feedback(Gc2*G, 1);
pole(G02)
step(G0, G02)
legend('G0', 'G02')