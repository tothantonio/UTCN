G2=tf([10,10],[1,10]);
t=0:0.01:30;
u=sin(t);
s=1j*1;
z=(10*s+1)/(s+10);
abs(z);
angle(z);
y=lsim(G2, u, t);
plot(t,u,t,y);
legend('u', 'y')
%bode(G2);
deg2rad(40)

%%
G3=tf([10],[1,1,1]);
t=0:0.01:30;
u=sin(t);
s=1j*1;
y=lsim(G3, u, t);
plot(t,u,t,y);
legend('u', 'y')
%bode(G3)
%%
G1=tf([0.1,1],[1,1]);
t=0:0.01:30;
u=sin(t);
s=1j*1;
y=lsim(G1, u, t);
plot(t,u,t,y)
legend('u', 'y')
%bode(G1)