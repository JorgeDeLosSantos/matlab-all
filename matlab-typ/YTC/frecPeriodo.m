f=0.1;  % Frecuencia
A=10;   % Amplitud
T=1/f;  % Periodo
x=-T:0.01:T;   % Vector con 2 periodos
y=A*sin(2*pi*f*x);
plot(x,y);
