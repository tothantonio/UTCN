%ex7
a1 = [0, 0;
      0, 0.16];
      
a2 = [0.85, 0.04;
     -0.04, 0.85];
     
a3 = [0.2, -0.26;
      0.23, 0.22];
      
a4 = [-0.15, 0.28;
      0.26, 0.24];
      
t1 = [0;0];
t2 = [0; 1.6];
t3 = [0; 1.6];
t4 = [0; 0.44];

numar_iteratii = 10000;

X = [0; 0];

v = X;

for i = 1:numar_iteratii - 1
    n = rand();
    
    if n < 0.01
        v = a1 * v + t1;
    elseif n < 0.8
        v = a2 * v + t2;
    elseif n < 0.9
        v = a3 * v + t3;
    else
        v = a4 * v + t4;
    end
        X = [X v];
end

figure;
plot(X(1,:), X(2,:), 'g.');
axis equal;
axis off;