function solsistemaED
[t,y]=ode45(@sistema,[0 2],[2 1]);
plot(t,y(:,1),'r',t,y(:,2),'b');
    function dy=sistema(t,y)
        dy=zeros(2,1);
        dy(1)=-5*y(1)+2*y(1)*y(2); 
        dy(2)=-4*y(2)+3*y(1)*y(2);
    end
end