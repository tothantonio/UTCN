function Grafice(a,b,n)
%functie care realizeaza pentru metodele de integrare numerica

x=linspace(a,b,n+1); 
Mjlc=0.5*(x(1:n)+x(2:n+1));


fig=0;
fig=fig+1;%reprezentarea grafica pentru Midpoint
figure(fig)
hold on
box on
z=a:0.05:b; 
Gf=f(z);
title('Graficul functiei si punctele grilei')
plot(z,Gf,'b')
plot(x,(min(Gf)-0.1)*ones(1,n+1),'r*')
plot(x,f(x),'r*')
line([a,b],[min(Gf)-0.1 min(Gf)-0.1],'Color','k','LineWidth',1.5)
for i=1:n+1
  line([x(i) x(i)], [min(Gf)-0.1 f(x(i))],'Color','r','LineStyle',':')
end
plot(Mjlc,(min(Gf)-0.1)*ones(1,n),'bo')
plot(Mjlc,f(Mjlc),'bo')
for i=1:n
   line([x(i) x(i+1)],[f(Mjlc(i)) f(Mjlc(i))],'Color','g','LineStyle',':','LineWidth',1.5)
   if f(x(i))<f(Mjlc(i))
   line([x(i) x(i)],[f(x(i)) f(Mjlc(i))],'Color','g','LineStyle',':','LineWidth',1.5)
   end
   if (f(x(i+1))<f(Mjlc(i)))
   line([x(i+1) x(i+1)],[f(x(i+1)) f(Mjlc(i))],'Color','g','LineStyle',':','LineWidth',1.5)  
   end
end

fig=fig+1; %reprezentarea grafica pentru regula trapezului
figure(fig)
hold on
box on
z=a:0.05:b; 
Gf=f(z);
title('Graficul functiei si punctele grilei')
plot(z,Gf,'b')
plot(x,(min(Gf)-0.1)*ones(1,n+1),'r*')
plot(x,f(x),'r*')
line([a,b],[min(Gf)-0.1 min(Gf)-0.1],'Color','k','LineWidth',1.5)
for i=1:n+1
  line([x(i) x(i)], [min(Gf)-0.1 f(x(i))],'Color','r','LineStyle',':')
end
for i=1:n
  line([x(i) x(i+1)], [f(x(i)) f(x(i+1))],'Color','g','LineStyle',':','LineWidth',1.5)
end

fig=fig+1; %reprezentarea grafica pentru regula Simpson
figure(fig)
hold on
box on
z=a:0.05:b; 
Gf=f(z);
title('Graficul functiei si punctele grilei')
plot(z,Gf,'b')
plot(x,(min(Gf)-0.1)*ones(1,n+1),'r*')
plot(Mjlc,(min(Gf)-0.1)*ones(1,n),'bo')
plot(x,f(x),'r*')
plot(Mjlc,f(Mjlc),'bo')
line([a,b],[min(Gf)-0.1 min(Gf)-0.1],'Color','k','LineWidth',1.5)
for i=1:n+1
  line([x(i) x(i)], [min(Gf)-0.1 f(x(i))],'Color','r','LineStyle',':')
end
 for i=1:n
      q=x(i):0.1:x(i+1); rezq=zeros(1,length(q));
      for k=1:length(q)
         rezq(k)=LagrangeBaricentric(q(k),[x(i),Mjlc(i),x(i+1)],[f(x(i)),f(Mjlc(i)),f(x(i+1))]);
      end
     plot(q,rezq,'Color','g','LineStyle',':','LineWidth',1.5)

 end


