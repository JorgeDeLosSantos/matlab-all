% function t_d=ed_cilindro(R,Ro)
R=10;Ro=1;
format short;
g=9.81;
dhdt=@(t,h) (-(Ro/R)^2)*sqrt(2*g*h);
[t,h]=ode45(dhdt,[0 1000],[2]);
plot(t,h);
for i=1:length(h)
    val=h(i);
    if h(i)<=0
        t_d=t(i);
        break;
    else
        t_d='';
    end
% end
end
