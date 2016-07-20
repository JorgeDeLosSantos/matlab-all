fprintf('Resolver por mètodo de eliminación Gauss \n \n');
M=input('\n Dame el número de filas: ');
N=input('\nDame el número de columnas: ');
fprintf('\n NOTA: Evite poner ceros en la diagonal de la matriz.')
if M==N
for x=1:M
for y=1:N+1
if y==1
fprintf('\nFila: %d',x);
end
fprintf('\nColumna %d',y);
D(x, y)=input(' :');
end
end
end
         D
x=1;
         e=M-1;
         f=1;
         for j=1:M
         a=1;
         for k=1:M+1
         if j==k
            if D(j,k)==0
                for q=j+1:M
                    if(D(q,k)~=0)
                        break
                    end
                end
                for d=1:M+1
                    A(j,d)=D(j,d);
                    D(j,d)=D(q,d);
                    D(q,d)=A(j,d);
                end
            end                  
        a=D(j,k);
        end
        D(j,k)=D(j,k)/a;
    end
    q=j+1;
    for t=q:M
        d=0;
        for s=1:M+1
            r=t; 
            if s==1
                d=D(r,x);
            end
            c(t,s)=D(x,s)*d;
            D(r,s)=D(r,s)-c(t,s);
        end
    end
    x=x+1;
    e=e-1;
end
f=M;
w=M+1;
for i=1:f
    T(i,1)=0;
end
for k=f:-1:1
    L=0;
    for j=f:-1:1
        L=D(k,j)*T(j,1)+L;
    end
    T(k,1)=(D(k,w)-L)/D(k,k);
end
for i=1:M
    S(1,i)=T(i,1);
end
disp(' X1,X2,X3,X4.......,Xn');
S
 m=M;
T1=M-1;
for t=1:T1
    for l=1:T1
        for s=1:M+1
            if s==1
                h=D(l,m);
            end
            c(t,s)=h*D(m,s);
            D(l,s)=D(l,s)-c(t,s);
        end
    end
    T1=T1-1;
    m=m-1;
end
         
fprintf('\n Integrantes del Equipo: \n\n Eduardo Coutiño Cabrera \n Pedro Jorge De Los Santos Lara \n Jose Gustavo Mendez Lara \n Oswaldo Mendoza De La Torre \n Mario Alfredo Molina Espinosa \n Kevin Alejandro Niño Vazquez \n')