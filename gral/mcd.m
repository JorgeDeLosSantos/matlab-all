function r=mcd(a,b)
while a>0
    t=a;
    a=rem(b,a);
    b=t;
end
r=b;
end