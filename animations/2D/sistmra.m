function sistmra
[t,y]=ode45(@edsmra,[0 10],[2 2]); % Solver del sistema de ED
plot(t,y(:,1))

    function dy=edsmra(t,y)
        c=1;m=1;k=10; %Parámetros: cte del amortiguador, masa y cte del resorte
        dy=zeros(2,1);
        dy(1)=y(2); % Sistema de ecuaciones diferenciales 
        dy(2)=-(c/m)*y(2)-(k/m)*y(1); % de primer orden
    end
end

