function rectaTangente(fun,xi)
fun = 'x^3+2*x';
xi = 6;
syms x
dfun=diff(sym(fun));
m=subs(dfun,x,xi);
rt=m*(x-xi)+subs(fun,x,xi);
h1=ezplot(fun,[xi-3 xi+3]);
hold on
h2=ezplot(rt,[xi-3 xi+3]);
set(h2,'color','r');
h3=plot(xi,subs(fun,x,xi),'k*','MarkerSize',10);
% legend(horzcat('y=',fun),horzcat('y=',char(rt)));
end