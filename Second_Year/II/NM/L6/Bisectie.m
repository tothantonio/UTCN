function [solaprox,nr_it]=Bisectie(a,b,it_max,epsilon,tipex)
st=fb(a,tipex);
dif=abs(b-a);
k=0; %contor pentru numarul de iteratii
while (dif>epsilon)&&(k<it_max)
    m=0.5*(a+b);
    vm=fb(m,tipex);
    k=k+1;
    if st*vm<0
        b=m;
    else
        a=m;
        st=vm;
    end
    dif=abs(b-a);
end

nr_it=k;
solaprox=m;
if k>=it_max
    fprintf('S-a depasit numarul de iteratii\n')
end