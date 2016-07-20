function L = longarco(f,a,b)
f='x';a=0;b=2;
f=sym(f);
df=diff(f,'x')
L=double(int(sqrt(1+df^2),'x',a,b));
% set(gca,'NextPlot','add');
% Y=subs(f,'x',a:0.1:b);
% plot(a:0.1:b,Y);
% axis([a-5 b+5 min(Y)-1 max(Y)+1]);
end