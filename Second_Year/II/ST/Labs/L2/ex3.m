
H1=tf(1,[1 1])
figure(3)
[y1,t1]=impulse(H1,10)
y1_calc=exp(-t1);
plot(t1,y1,t1,y1_calc,'r*')

H2=tf(1,[1 -1])
figure(4)
[y2,t2]=impulse(H2,10)
y2_calc=exp(t2)
plot(t2,y2,t2,y2_calc,'r*')

H3=tf(1,[1 0 -1])
figure(5)
impulse(H3,10)

H4=tf(1,[1 0 1])
figure(6)
impulse(H4,10)

H5=tf(1,[1 2 17])
figure(7)
impulse(H5,10)

